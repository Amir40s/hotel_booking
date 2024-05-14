importScripts('https://www.gstatic.com/firebasejs/8.4.1/firebase-app.js');
importScripts('https://www.gstatic.com/firebasejs/8.4.1/firebase-messaging.js');


  const firebaseConfig = {
      apiKey: 'AIzaSyAoI7G7foqcsI-gNZD5LEXc9sfU2X0ONEc',
          appId: '1:984056689373:web:b37fb6720dc2e00b6ca134',
          messagingSenderId: '984056689373',
          projectId: 'hotel-booking-b1d5c',
          authDomain: 'hotel-booking-b1d5c.firebaseapp.com',
          storageBucket: 'hotel-booking-b1d5c.appspot.com',
          measurementId: 'G-18PGEFWN2H',
    };
  firebase.initializeApp(firebaseConfig);
  const messaging = firebase.messaging();


  messaging.onBackgroundMessage(function(payload) {
    console.log('Received background message ', payload);

    const notificationTitle = payload.notification.title;
    const notificationOptions = {
      body: payload.notification.body,
    };

    self.registration.showNotification(notificationTitle,
      notificationOptions);
  });