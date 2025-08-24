/* Firebase Messaging Service Worker */
/* eslint-disable no-undef */

importScripts('https://www.gstatic.com/firebasejs/10.12.3/firebase-app-compat.js');
importScripts('https://www.gstatic.com/firebasejs/10.12.3/firebase-messaging-compat.js');

// Initialize Firebase in the service worker via compat using your project's config
// These values are public and match lib/firebase_options.dart (web)
firebase.initializeApp({
  apiKey: 'AIzaSyCcRghyFvpCil6k3NvNK_u2wp0UDuDydcU',
  appId: '1:1053773858698:web:af574425443d909eb22a73',
  messagingSenderId: '1053773858698',
  projectId: 'thikramuslimathkar',
  authDomain: 'thikramuslimathkar.firebaseapp.com',
  storageBucket: 'thikramuslimathkar.firebasestorage.app',
  measurementId: 'G-0XX0P2CNHR',
});

// Retrieve an instance of Firebase Messaging so that it can handle background
// messages.
let messaging;
try {
  messaging = firebase.messaging();
} catch (e) {
  // no-op
}

// Optional: background notification handler
if (messaging && messaging.setBackgroundMessageHandler) {
  messaging.setBackgroundMessageHandler(function (payload) {
    const title = (payload.notification && payload.notification.title) || 'Notification';
    const options = {
      body: payload.notification && payload.notification.body,
      icon: payload.notification && payload.notification.icon,
      data: payload.data || {}
    };
    return self.registration.showNotification(title, options);
  });
}
