'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "6c14858378ceceaaaaf22c674bace39b",
"assets/AssetManifest.bin.json": "992f08fec723cd42ef59f558e5ceabc6",
"assets/AssetManifest.json": "d3c0826c737e4b049df2e1d038651574",
"assets/assets/fonts/NicoMoji-Regular.ttf": "73c00071d90ecfb78bf0ccdeda529307",
"assets/assets/images/icons/addw.png": "572327267bf332e6c00af5e032971934",
"assets/assets/images/icons/application.png": "88dd49a1ddf055a2a2d002198ba38709",
"assets/assets/images/icons/bell.png": "f837b088e92ef5b5da3144ea3ad509e3",
"assets/assets/images/icons/bitcoin.png": "7d6c5479f1b81c5a74e5c244ecc9078b",
"assets/assets/images/icons/briefcase.png": "afbd1f0a7c07b0e9ec79a368dc0aaced",
"assets/assets/images/icons/businessman-with-tie.png": "28d0fbec3748d3df729074c5dd9c9211",
"assets/assets/images/icons/calendar.png": "14c3d57c6e67ad522b50f18baf77ba12",
"assets/assets/images/icons/cancel.png": "601677b213087d34cf476c858e73dc66",
"assets/assets/images/icons/chat.png": "180f536cab8cf92c4231c20a8c973f84",
"assets/assets/images/icons/check-mark.png": "b545fee912eb6394f0327e21ce93682a",
"assets/assets/images/icons/client.png": "b1315ea98c6d38145ade339945931637",
"assets/assets/images/icons/clock.png": "7baec1c0365ee845386e6701713a3bd1",
"assets/assets/images/icons/coin.png": "2c4c60e4e471728067ea70c714478dd2",
"assets/assets/images/icons/consultation.png": "228e2df43e98d91dfe5e015cc8ac4154",
"assets/assets/images/icons/copy.png": "530032a3d3ad5682c3af125bbf424ce6",
"assets/assets/images/icons/docs.png": "5da45a96e9eaf7fcb22c349520c143a7",
"assets/assets/images/icons/down-arrow.png": "14ca33dd9f0cac9b0ac1c39a8bd4ebcd",
"assets/assets/images/icons/factory.png": "5757043e55e80ac9bc5232b69c693e78",
"assets/assets/images/icons/filter.png": "21ab34834b543559c8ae4ea9afcf5081",
"assets/assets/images/icons/folder.png": "f68657f4795208c4a3bb06f5a4988e0c",
"assets/assets/images/icons/group-chat.png": "7798cf0a65956f8476bd119a6c6f1cde",
"assets/assets/images/icons/hamburger.png": "927be4b9a71f5b3d486feef36dfa9dc0",
"assets/assets/images/icons/heart.png": "c5a2d7dd60885d97865a18ce301e2ef1",
"assets/assets/images/icons/hide.png": "e95ae313a14777fa3e045d671595c7b3",
"assets/assets/images/icons/home.png": "7ccd3100c3101ef3868eaceefc5041fa",
"assets/assets/images/icons/information-technology.png": "7524c4bc4810bf92962d5c9398b18b4a",
"assets/assets/images/icons/investor.png": "73f9ca02464dbd4dbec8bdb13595c705",
"assets/assets/images/icons/iPhone%252016%2520Pro%2520Max%2520-%25204.png": "4afd8fc9e979e5535508a4b730adcbd4",
"assets/assets/images/icons/location.png": "6fd82d18788dc5a6b2c3201fac0ad3e5",
"assets/assets/images/icons/locked-computer.png": "961b7d4b501f9389d31002f626a5acbb",
"assets/assets/images/icons/logistics.png": "7429bd4889a7731743bd60a7d6307b1f",
"assets/assets/images/icons/microchip.png": "b8fb3c522f73381e7ea666bc08fd8697",
"assets/assets/images/icons/more.png": "e51a6b867359055493fa227a835e0ff9",
"assets/assets/images/icons/online-shopping.png": "76b94ea520e050c26b31c4717bb666d6",
"assets/assets/images/icons/option.png": "f957f2ce44c9405bc44bbe5357903ad1",
"assets/assets/images/icons/profit.png": "2086dcbf3860521c4866ccdedcec6e6b",
"assets/assets/images/icons/return-of-investment.png": "9a5e66311b82d4cc55aa37a6732a6452",
"assets/assets/images/icons/search-interface-symbol.png": "88645072a441c4e05be4244fb3628316",
"assets/assets/images/icons/send%2520(1).png": "c265ad0ae925cafb14868ab3476e202b",
"assets/assets/images/icons/send.png": "c9eada489bf11411f30b289c3ad5c7ad",
"assets/assets/images/icons/share.png": "e857485daeb108557d4c3f27558d6657",
"assets/assets/images/icons/social-media-marketing.png": "d42e562c3c604ef73c3d24f6343fdd9c",
"assets/assets/images/icons/targeting.png": "55220b00f3d52029816cc674a6bb43b6",
"assets/assets/images/icons/user%2520(1).png": "a5109d089dfb841701aa800cf84407ab",
"assets/assets/images/icons/user%2520(2).png": "10b37afcaf791f70e968e0a488772f27",
"assets/assets/images/icons/video-editing.png": "636ebe072da79fd28d9c4a1c2f8c164f",
"assets/assets/images/icons/warning.png": "ae1eff8e12a3159524e66db07efe6382",
"assets/assets/images/icons/web.png": "80dc1042e71702fb2cb7a8b1f425a21f",
"assets/assets/images/illustrations/photo.png": "8279f7796ccf683f081834c25df22317",
"assets/assets/images/logos/Apple_logo_black.png": "ff21c418fbeca4eb5266efc6c092c1f3",
"assets/assets/images/logos/download.png": "1a3f90a26d7c082b0c314dd6ba9e34fd",
"assets/assets/images/logos/google-drive.png": "386ea33b05dda21a575b4f8c34bd43ff",
"assets/assets/images/logos/images-Photoroom.png": "c5b9975aa58ced3d6ea53d385d696e71",
"assets/assets/images/logos/instagram.png": "a257c2644cba10f2650171ffb5187b5a",
"assets/assets/images/logos/mail.png": "38cfd7e82754eda49c570ba082cced7c",
"assets/assets/images/logos/message.png": "a5adaeefb35e01e9a7286e583147910f",
"assets/assets/images/logos/wpplogo.png": "167fc73ac652736812d8690c18116b30",
"assets/FontManifest.json": "5865acea9fe6cd05dff1388be3f7e469",
"assets/fonts/MaterialIcons-Regular.otf": "b7f89af91b54f91b3f94bb660c189f18",
"assets/NOTICES": "7806f7334b0f46bb5f7eeeb74c10310f",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "140ccb7d34d0a55065fbd422b843add6",
"canvaskit/canvaskit.js.symbols": "58832fbed59e00d2190aa295c4d70360",
"canvaskit/canvaskit.wasm": "07b9f5853202304d3b0749d9306573cc",
"canvaskit/chromium/canvaskit.js": "5e27aae346eee469027c80af0751d53d",
"canvaskit/chromium/canvaskit.js.symbols": "193deaca1a1424049326d4a91ad1d88d",
"canvaskit/chromium/canvaskit.wasm": "24c77e750a7fa6d474198905249ff506",
"canvaskit/skwasm.js": "1ef3ea3a0fec4569e5d531da25f34095",
"canvaskit/skwasm.js.symbols": "0088242d10d7e7d6d2649d1fe1bda7c1",
"canvaskit/skwasm.wasm": "264db41426307cfc7fa44b95a7772109",
"canvaskit/skwasm_heavy.js": "413f5b2b2d9345f37de148e2544f584f",
"canvaskit/skwasm_heavy.js.symbols": "3c01ec03b5de6d62c34e17014d1decd3",
"canvaskit/skwasm_heavy.wasm": "8034ad26ba2485dab2fd49bdd786837b",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "888483df48293866f9f41d3d9274a779",
"flutter_bootstrap.js": "6a221510ee7ff06012390b61e552dca2",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "62c1a907f6e50025f73f2671f3bbb6d9",
"/": "62c1a907f6e50025f73f2671f3bbb6d9",
"main.dart.js": "31245a698fcd682374712f5d54e896cf",
"manifest.json": "fa20d2202cd1b529eca3381038ad8575",
"version.json": "e52c7aaae900e7634a028feab7ebf3d2"};
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
