package main

import (
	"log"
	"net/http"

	"github.com/gorilla/websocket"
)

// Пользователи вебсокет, канал для сообщений, массив активных пользователей (Для видео)
var clientsVideo = make(map[*websocket.Conn]bool)
var broadcastVideo = make(chan Video)
var clientMassVideo = make(map[string]*websocket.Conn)

// Конфигурация будущих вебсокет соединений (разрешение получени и отправки всех данных)
var upgrader = websocket.Upgrader{
	CheckOrigin: func(r *http.Request) bool {
		return true
	},
}

// Структура видео потока
type Video struct {
	Data string `json:"data"`
}

func main() {
	// Create a simple file server
	fs := http.FileServer(http.Dir("public"))
	http.Handle("/", fs)

	// Configure websocket route
	http.HandleFunc("/video", handleConnectionsVideo)

	// Start listening for incoming chat messages
	go handleMessagesVideo() // Рутина для видео

	// Start the server on localhost port 8000 and log any errors
	log.Println("http server started on :8090")
	err := http.ListenAndServe(":8090", nil)
	if err != nil {
		log.Fatal("ListenAndServe: ", err)
	}
}

func handleConnectionsVideo(w http.ResponseWriter, r *http.Request) {
	// Upgrade initial GET request to a websocket
	log.Println("User connected: " + r.Host)

	ws, err := upgrader.Upgrade(w, r, nil)
	if err != nil {
		log.Fatal(err)
	}

	// Register our new client
	clientsVideo[ws] = true
	clientMassVideo[r.Host] = ws

	// Sending Text message to client
	var video Video

	for {
		err := ws.ReadJSON(&video)
		if err != nil {
			log.Printf("error: %v", err)
			delete(clientsVideo, ws)
			break
		}
		broadcastVideo <- video
	}
}

func handleMessagesVideo() {
	for {
		video := <-broadcastVideo
		for client := range clientsVideo {
			err := client.WriteJSON(video)
			if err != nil {
				log.Printf("error: %v", err)
				client.Close()
				delete(clientsVideo, client)
			}
		}
	}
}
