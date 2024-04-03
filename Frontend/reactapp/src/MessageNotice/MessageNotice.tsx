import React, {useRef, useState} from 'react';
import styles from './MessageNotice.module.scss'
import {observer} from "mobx-react-lite";
import {CSSTransition, Transition} from "react-transition-group";

const MessageNotice = observer((props: any) => {
    const {message, setMessageNotice} = props
    const nodeRef = useRef(null)
    const [animation, setAnimation] = useState<boolean>(true)
    const [over, setOver] = useState<boolean>(false)
    const deleteFromArray = (id:string) => {
        setMessageNotice((prev: any[]) => prev.filter((m: any) => m.id !== id))
    }

    const duration = 5000

    return (
        <CSSTransition
            key={message.id}
            in={animation}
            appear={true}
            unmountOnExit
            enter={true}
            exit={true}
            timeout={{enter: 2000, exit: 5000}}
            onEntered={() => {
                setAnimation(over)
            }}
            onExiting={() => {
                setAnimation(over)
            }}
            onExited={() => deleteFromArray(message.id)}
            classNames={{
                enter: styles.noticeContainerEnter,
                // enterActive: styles.noticeContainerEnterActive,
                enterDone: styles.noticeContainerEnterDone,
                exit: styles.noticeContainerExit,
                exitActive: styles.noticeContainerExitActive,
                exitDone: styles.noticeContainerExitDone
            }}
            nodeRef={nodeRef}
        >
                    <div ref={nodeRef} key={message.id} className={styles.noticeContainer}
                          onMouseOver={()=> setAnimation(true)}
                         onMouseOut={()=> setAnimation(false)}
                    >
                        <div id={"imageContainer"} className={styles.imageContainer}></div>
                        <div id={"message"} className={styles.messageContent}>
                            <div className={styles.messageHeader}>{message.usersenderid}</div>
                            <div className={styles.messageText}>
                                {message.text}
                            </div>
                        </div>
                        <div className={styles.closeButton}
                             onClick={() => deleteFromArray(message.id)}>X</div>
                    </div>
        </CSSTransition>
    );
});

//     const duration = 3000
//
//     const defaultStyle  = {
//         transition: `opacity ${duration}ms ease-in-out`,
//         opacity: 0,
//     }
//
//     const transitionStyles:any = {
//         entering: { opacity: 1 },
//         entered:  { opacity: 1 },
//         exiting:  { opacity: 0 },
//         exited:  { opacity: 0 },
//     };
//
//     return (
//         <Transition
//             key={message.id}
//             in={startAnim}
//             appear={true}
//             unmountOnExit
//             enter={true}
//             exit={true}
//             // timeout={{enter: 5000, exit: 5000}}
//             timeout={duration}
//             onEntered={() => setStartAnim(false)}
//             onExited={() => deleteFromArray(message.id)}
//             classNames={styles.animation}
//             nodeRef={nodeRef}
//             // appear={true}
//         >
//             {
//                 state =>
//                     (<div ref={nodeRef} key={message.id} className={styles.noticeContainer}
//                          onClick={()=> setStartAnim(true)}
//                          style={{
//                              ...defaultStyle,
//                              ...transitionStyles[state]
//                          }}
//                         >
//                         <div id={"imageContainer"} className={styles.imageContainer}></div>
//                         <div id={"message"} className={styles.messageContent}>
//                             <div className={styles.messageHeader}>{message.usersenderid}</div>
//                             <div className={styles.messageText}>
//                                 {message.text}
//                             </div>
//                         </div>
//                         <div className={styles.closeButton}
//                         onClick={() => deleteFromArray(message.id)}>X</div>
//                     </div>)
//
//             }
//          </Transition>
//
//     );
// });

export default MessageNotice;