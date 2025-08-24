'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "32c8703a1e02c8ab829b719d2beb543b",
"assets/AssetManifest.bin.json": "f9ab2f7e1a038e528f09a7f7d1724e62",
"assets/AssetManifest.json": "2c831f9b619f5e76b17629853deb9396",
"assets/D%253A%255CCode%255CFlutter%255Cmuslim_azkar%255Clib%255CMedia%255CIcons%255Cdua.png": "6717c334d235da04e2892df6f838cd95",
"assets/D%253A%255CCode%255CFlutter%255Cmuslim_azkar%255Clib%255CMedia%255CIcons%255CHadith.png": "7099d6bc38be7c3227a8c4996b3ea155",
"assets/D%253A%255CCode%255CFlutter%255Cmuslim_azkar%255Clib%255CMedia%255CIcons%255CIslam.png": "6c99c26b1017b77ac72517bb0fb0fb93",
"assets/D%253A%255CCode%255CFlutter%255Cmuslim_azkar%255Clib%255CMedia%255CIcons%255Cmuslim-tasbih.png": "ed3c1fe299e12e6d99b184c35413a568",
"assets/D%253A%255CCode%255CFlutter%255Cmuslim_azkar%255Clib%255CMedia%255CIcons%255Cnight.png": "eadfe07a94d47943440f113ed45d8c92",
"assets/D%253A%255CCode%255CFlutter%255Cmuslim_azkar%255Clib%255CMedia%255CIcons%255CProphet.png": "fd7c7a01ef60c6a1203785b22e99e1cd",
"assets/D%253A%255CCode%255CFlutter%255Cmuslim_azkar%255Clib%255CMedia%255CIcons%255CQuran.png": "9d0ae28e8217eed82cef018091fabca7",
"assets/D%253A%255CCode%255CFlutter%255Cmuslim_azkar%255Clib%255CMedia%255CIcons%255Csun.png": "5d256aea587cd26b37f54ed32908d104",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "394ae3375a3809df68a1a4a32394e114",
"assets/lib/Media/Icons/dua.png": "6717c334d235da04e2892df6f838cd95",
"assets/lib/Media/Icons/Hadith.png": "7099d6bc38be7c3227a8c4996b3ea155",
"assets/lib/Media/Icons/Islam.png": "6c99c26b1017b77ac72517bb0fb0fb93",
"assets/lib/Media/Icons/muslim-tasbih.png": "ed3c1fe299e12e6d99b184c35413a568",
"assets/lib/Media/Icons/night.png": "eadfe07a94d47943440f113ed45d8c92",
"assets/lib/Media/Icons/Prophet.png": "fd7c7a01ef60c6a1203785b22e99e1cd",
"assets/lib/Media/Icons/Quran.png": "9d0ae28e8217eed82cef018091fabca7",
"assets/lib/Media/Icons/sun.png": "5d256aea587cd26b37f54ed32908d104",
"assets/NOTICES": "c985e3ccd86b13d79c6ba8ad1eced3c7",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/packages/flutter_js/assets/js/fetch.js": "277e0c5ec36810cbe57371a4b7e26be0",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "6cfe36b4647fbfa15683e09e7dd366bc",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/chromium/canvaskit.js": "ba4a8ae1a65ff3ad81c6818fd47e348b",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"firebase-messaging-sw.js": "d7a717dfd131c6e5c24aec32ff9ba839",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"flutter_bootstrap.js": "6b803939e2e279fc9794154962c68210",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "125cb40c50a40976784f611ee86715af",
"/": "125cb40c50a40976784f611ee86715af",
"main.dart.js": "5ce5fa5346942fe47c33f4bc41844127",
"manifest.json": "9cc5f533ee6cae0530312cdefa29dd73",
"splash/img/branding-1x.png": "de0718b54970a22937584733d10383a7",
"splash/img/branding-2x.png": "dfd8505e839b3b70498a1e6150f6c36b",
"splash/img/branding-3x.png": "9e740e256459eface4676daed8d05e02",
"splash/img/branding-4x.png": "010656a287da4fcb2c639e41f9722a13",
"splash/img/branding-dark-1x.png": "de0718b54970a22937584733d10383a7",
"splash/img/branding-dark-2x.png": "dfd8505e839b3b70498a1e6150f6c36b",
"splash/img/branding-dark-3x.png": "9e740e256459eface4676daed8d05e02",
"splash/img/branding-dark-4x.png": "010656a287da4fcb2c639e41f9722a13",
"splash/img/dark-1x.png": "da0617d2fd8ff6bed58ecfb21f824dc4",
"splash/img/dark-2x.png": "c7a6ae6ce7cf1b76b83823f03eb12be7",
"splash/img/dark-3x.png": "1f9921bbf2fbb72acab986f96f92d0f9",
"splash/img/dark-4x.png": "016f4110af01d8fce93d4aac840e3a8b",
"splash/img/light-1x.png": "da0617d2fd8ff6bed58ecfb21f824dc4",
"splash/img/light-2x.png": "c7a6ae6ce7cf1b76b83823f03eb12be7",
"splash/img/light-3x.png": "1f9921bbf2fbb72acab986f96f92d0f9",
"splash/img/light-4x.png": "016f4110af01d8fce93d4aac840e3a8b",
"version.json": "58a366cb4d11c98635ffe8f03105591e"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
