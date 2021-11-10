'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "dc40eb80c2293cb722a3a4e7aa12600b",
"assets/assets/images/AAVE.png": "262e882a668bd8c69896197f4a6a63af",
"assets/assets/images/ABT.png": "a9ae13b6dbe7cbccbeeb488805df6e85",
"assets/assets/images/ADA.png": "c5f77c3d08d1ba053d9ff28508f6e675",
"assets/assets/images/ALPHA.png": "7dff5890ccfe6d9850378d05264b451e",
"assets/assets/images/AXS.png": "2fcc61a1d507b6d05c1e667664c83439",
"assets/assets/images/BAL.png": "4b790bcb4798722ccadceb51d8eccc0b",
"assets/assets/images/BAND.png": "7b2502619d0248215a9079025456fd14",
"assets/assets/images/BAT.png": "92b34aacfc917e68b5b49dec86ef9f07",
"assets/assets/images/BCH.png": "7fda678fc6440b7aeddee8e5e000e496",
"assets/assets/images/bg.png": "9370b8d777255f6cf6eee4534bcd65e5",
"assets/assets/images/BNB.png": "2b3bbf7ee91f258944e60d29353b2dd1",
"assets/assets/images/BSV.png": "d2eeb549882b5d8b07cd78b457730b09",
"assets/assets/images/BTC.png": "19a782b22f2f9130651470b0ef9356f8",
"assets/assets/images/COMP.png": "bb252b51065678c08eab5b2b535c3791",
"assets/assets/images/CRV.png": "7f65d2f75e60a4962665167c372ed809",
"assets/assets/images/CTXC.png": "75659acb5a6048c121a17ce4de6f5ba6",
"assets/assets/images/CVC.png": "c2bd2c3ac7c696f9d0473aa9aa9bd93e",
"assets/assets/images/DAI.png": "18a73aad50e48106bf3761dea55ac07d",
"assets/assets/images/DOGE.png": "4adc4054a8d648ef876838d71d62222c",
"assets/assets/images/DON.png": "5bb9013d12205eab10789046f0bc0150",
"assets/assets/images/DOT.png": "4265a2871ab48083bafee9f6fd67b367",
"assets/assets/images/ENJ.png": "f69c1be4ae0ac9e94731b7341767a529",
"assets/assets/images/ETH.png": "70ec7f6b6b1d81900bad333c576f837f",
"assets/assets/images/EVX.png": "49d586f9396c54c17866e9443c2dc759",
"assets/assets/images/GLM.png": "2ab79e58910d910cc3ba4b87e39fc08c",
"assets/assets/images/IOST.png": "256c7022198b3a73870351671019e35e",
"assets/assets/images/JFIN.png": "2aed51429969e29546c4b2438b6110fa",
"assets/assets/images/KNC.png": "2d9693f46e4ae37a10447584ba726665",
"assets/assets/images/KSM.png": "c3f58e8fa1ee671e937b5796880d91d6",
"assets/assets/images/KUB.png": "145be22d83fd46d5194923278575c7c1",
"assets/assets/images/LINK.png": "9dbfd62601411e33c8389c5690179226",
"assets/assets/images/logo_apix.png": "49028656e350ad73e654514afad06f11",
"assets/assets/images/LTC.png": "80337c4042fe7b0a1e0255393e6a5fe2",
"assets/assets/images/MANA.png": "2e7fb56d7fe9fd4fe3f4e5755ee9e8cf",
"assets/assets/images/MKR.png": "a08df2aa9e04610265d5c37ed9c56103",
"assets/assets/images/NEAR.png": "58bd74624556b07a94af3979f48ec255",
"assets/assets/images/OMG.png": "b94d3f506026ebe4d858161a71c62e53",
"assets/assets/images/POW.png": "4273a6b541d6af0b17708e0674d8992e",
"assets/assets/images/RDN.png": "696f92435a5271abe45ca7e5333d26af",
"assets/assets/images/SAND.png": "42eb8ea0fa9ec9c7905aecfa5824de8b",
"assets/assets/images/SCRT.png": "40a4970b6cae429c93f75aa68f3295dc",
"assets/assets/images/SIX.png": "924fb4b91aee018758efb06368fe4184",
"assets/assets/images/SNT.png": "94beeaa7c2668c9bacab1c8b73159f50",
"assets/assets/images/SUSHI.png": "278d6d657db891e719d721dd9cd113fc",
"assets/assets/images/UNI.png": "f205a383242bc1670c6961c1f2c0e8e3",
"assets/assets/images/USDC.png": "433e128d166a0e20b0241f1082953bb2",
"assets/assets/images/USDT.png": "80049508a5c31cfa159e1f0e4ed85ac6",
"assets/assets/images/WAN.png": "f672b9b251251210b9ac6870b58cf260",
"assets/assets/images/XLM.png": "9939b6099f91f87211e42bad52c6f398",
"assets/assets/images/XRP.png": "ea637dbf569586511421ebf550ac4db6",
"assets/assets/images/YFI.png": "7d5bdd3aeae2848342d2504f1ef928a8",
"assets/assets/images/ZIL.png": "1f08d2285d5dab9ddd485ff04803739a",
"assets/assets/images/ZRX.png": "f124f630e1321d2269db541341bd1cfe",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "4e6447691c9509f7acdbf8a931a85ca1",
"assets/NOTICES": "288201635058693ef99a4e723c405bce",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"favicon.ico": "8805f5d2e11c4cbab65a64ca3ba9c7e1",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "b6685f64fb81cd0c1e101751018d0563",
"/": "b6685f64fb81cd0c1e101751018d0563",
"main.dart.js": "cafb4ebd6d87e34576b698b3dfc891c8",
"manifest.json": "4affdb58e4233587559e0e976ed48125",
"version.json": "eb1a9a10f733882a0c323cc099f61c26"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
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
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
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
