import './main.css';
import {Elm} from './Main.elm';
import * as serviceWorker from './serviceWorker';

import * as firebase from "firebase/app";

import "firebase/auth";
import "firebase/firestore";
import "firebase/analytics";

const firebaseConfig = {
    apiKey: "AIzaSyA-DWOLWcqAB4YJlwOlseYbi684m2jaVD0",
    authDomain: "route-063-jp.firebaseapp.com",
    databaseURL: "https://route-063-jp.firebaseio.com",
    projectId: "route-063-jp",
    storageBucket: "route-063-jp.appspot.com",
    messagingSenderId: "1013476788170",
    appId: "1:1013476788170:web:8571cd2bec858443427133",
    measurementId: "G-T0X4VT3Y60"
};

firebase.initializeApp(firebaseConfig);
firebase.analytics();

let app = Elm.Main.init({
    node: document.getElementById('root')
});

let db = firebase.firestore();

db.collection("users").onSnapshot((querySnapshot) => {
    querySnapshot.forEach((doc) => {
        console.log(`${doc.id} => ${doc.data()}`);
    });
});

// If you want your app to work offline and load faster, you can change
// unregister() to register() below. Note this comes with some pitfalls.
// Learn more about service workers: https://bit.ly/CRA-PWA
serviceWorker.unregister();
