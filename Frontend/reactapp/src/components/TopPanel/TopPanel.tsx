import React from 'react';
import styles from "./TopPanel.module.scss"

const TopPanel = ({children}: any) => {
    return (
        <div className={styles.topPanel}>
            {
                children
            }
        </div>
    );
};

export default TopPanel;