'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  ".dart_tool/dartpad/web_plugin_registrant.dart": "7ed35bc85b7658d113371ffc24d07117",
".dart_tool/flutter_build/a401100882b1f705d80015425aebb9db/app.dill": "9f8407576ad278bdc981d922d8ea08ed",
".dart_tool/flutter_build/a401100882b1f705d80015425aebb9db/app.dill.deps": "47782484281894b6e1f2947afa908fcd",
".dart_tool/flutter_build/a401100882b1f705d80015425aebb9db/dart2js.d": "614e480cc87cf4d5d4001cb479a9e267",
".dart_tool/flutter_build/a401100882b1f705d80015425aebb9db/dart2js.stamp": "e524a880a443e001e73217f850a87b06",
".dart_tool/flutter_build/a401100882b1f705d80015425aebb9db/flutter_assets.d": "3d3381d9f5544733a05efd7ffc8a7bca",
".dart_tool/flutter_build/a401100882b1f705d80015425aebb9db/gen_localizations.stamp": "436d2f2faeb7041740ee3f49a985d62a",
".dart_tool/flutter_build/a401100882b1f705d80015425aebb9db/main.dart": "ab7b5407e7bce6f30b69bded14a0155a",
".dart_tool/flutter_build/a401100882b1f705d80015425aebb9db/main.dart.js": "939338bf718df780320d9dc48198afa1",
".dart_tool/flutter_build/a401100882b1f705d80015425aebb9db/main.dart.js.deps": "43f245a8ba4a62803690a5ddbd4d9b38",
".dart_tool/flutter_build/a401100882b1f705d80015425aebb9db/outputs.json": "2415b1681b1ff26a08453b52aa6a3399",
".dart_tool/flutter_build/a401100882b1f705d80015425aebb9db/service_worker.d": "458597de7e6a54e2b9a3010810492107",
".dart_tool/flutter_build/a401100882b1f705d80015425aebb9db/web_entrypoint.stamp": "a5333d23d2510eed12e4346daca0b08e",
".dart_tool/flutter_build/a401100882b1f705d80015425aebb9db/web_plugin_registrant.dart": "7ed35bc85b7658d113371ffc24d07117",
".dart_tool/flutter_build/a401100882b1f705d80015425aebb9db/web_release_bundle.stamp": "350900bb1b522a73403ff1b2d1e6940f",
".dart_tool/flutter_build/a401100882b1f705d80015425aebb9db/web_resources.d": "441d655f8bfc48608b331be506437653",
".dart_tool/flutter_build/a401100882b1f705d80015425aebb9db/web_service_worker.stamp": "b77bb74c75a73ebe469a7476e32f55bb",
".dart_tool/flutter_build/a401100882b1f705d80015425aebb9db/web_static_assets.stamp": "436d2f2faeb7041740ee3f49a985d62a",
".dart_tool/package_config.json": "177f18ad957cd45b0a9c21e7881a05ba",
".dart_tool/package_config_subset": "48bb935e5e5b3e4d27d0f47b032b2989",
".dart_tool/version": "f7a307d5d6b1748af3468afbea376c25",
".idea/libraries/Dart_SDK.xml": "b1c063a4e609ba87bc7c7200be8b0e78",
".idea/libraries/KotlinJavaRuntime.xml": "de38cfadca3106f8aff5ab15dd81692f",
".idea/modules.xml": "8f04d1672433a5030e6b4e45f5c45ce5",
".idea/runConfigurations/main_dart.xml": "0ecf958af289efc3fc1927aa27a8442f",
".idea/workspace.xml": "25155dfb2368a7e35e1ebbecd505a418",
"analysis_options.yaml": "5df212687f3997ccd1310b5b19ebfb78",
"assets/AssetManifest.json": "0f5ee354938e0bc75683949d40ce2b16",
"assets/assets/icons/account-svgrepo-com.svg": "a474ef4e352692304a54dfbe8266bf60",
"assets/assets/icons/bag-outline-svgrepo-com.svg": "849f1878a0746434e0b45b240ccff821",
"assets/assets/icons/bell-notification-svgrepo-com.svg": "dadee62129fd3abc816a414bcb1c094f",
"assets/assets/icons/coffee-cup-coffee-svgrepo-com.svg": "6c654344347f2b83e6d9975f832ae79d",
"assets/assets/icons/coffee-svgrepo-com.svg": "263d9065fc3f1180cddb7308d86f7f1c",
"assets/assets/icons/favourite-svgrepo-com.svg": "f90fae6481e9e6f228fb312859726803",
"assets/assets/icons/filter.svg": "ac304bbe9b7daefd244bedea9f3d5e0c",
"assets/assets/icons/home-svgrepo-com.svg": "9283e4b060dbe9e27e48a906d5cef97a",
"assets/assets/icons/location-pin-svgrepo-com.svg": "a06a79cbd024c32c4bc79c6d092c531a",
"assets/assets/icons/mail-left-arrow-svgrepo-com.svg": "6a42c4ec2b3b9c562e458a7dce9604ee",
"assets/assets/icons/menu-alt-05-svgrepo-com.svg": "bf24839e25ee221a183e0fb81b6b7965",
"assets/assets/icons/profile-svgrepo-com.svg": "85958be4123734439aca3e16ce15a6d1",
"assets/assets/icons/restaurant-menu-svgrepo-com.svg": "c6b172c0e6f0d72476dd36e170bb5e05",
"assets/assets/icons/search-svgrepo-com.svg": "283baa1ca8cd25f290beaac2f8e3ba30",
"assets/assets/icons/smartphone-svgrepo-com.svg": "2f9e17c8cba78ecf861679075d152452",
"assets/assets/icons/time-quarter-to-svgrepo-com.svg": "3410919a0eed99611675a6de341a8743",
"assets/assets/icons/website-ui-web-svgrepo-com.svg": "75e0289fecf17c60a7db7f5497892b1b",
"assets/assets/image/1.jpg": "de1bc1211912706f0f17b0744530123f",
"assets/assets/image/2.jpg": "c0afacb2a6235d91017432e734e0eb40",
"assets/assets/image/3.jpg": "6ea99c7ec4b53bb1049f935e514a0d5b",
"assets/assets/image/4.jpg": "5eaf362474240c605d2bd04dd82e85c4",
"assets/assets/image/5.jpg": "3836e5e833210c4f263c0500b4272161",
"assets/assets/image/6.jpg": "4abb66f9a45d09ef818c7d97f2850ce9",
"assets/assets/image/7.jpg": "67d7ceaf9bc66a50004ba2f30be1e070",
"assets/assets/image/8.jpg": "90d77a1b4da17a2c5a3dfd1ecc51a140",
"assets/assets/image/9.jpg": "38543086a22da3f1674ba55dd49bad11",
"assets/assets/image/back.jpg": "13748ce7d4eec01cf6a406c1f6576ff4",
"assets/assets/image/cobon1.jpg": "e2dc62fbad2e637c86fe2f92fa5ad7e1",
"assets/assets/image/cobon2.jpg": "e075b9760dbf4173df0cce6191f45c6c",
"assets/assets/image/Gourmet.jpg": "05c0a0195cde494c26bf7fcdfc9db3a7",
"assets/assets/image/Gourmet_Logo.png": "05c0a0195cde494c26bf7fcdfc9db3a7",
"assets/assets/image/MenuElements.png": "149c4f8a6677670a49357ebaec33718e",
"assets/assets/image/splash.png": "c7a099179b8e06f2e3ee5f2fc75ddf79",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "e7069dfd19b331be16bed984668fe080",
"assets/NOTICES": "a4cb646ec311d0de19f18702b37e2a39",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/fluttertoast/assets/toastify.css": "a85675050054f179444bc5ad70ffc635",
"assets/packages/fluttertoast/assets/toastify.js": "56e2c9cedd97f10e7e5f1cebd85d53e3",
"assets/packages/flutter_map/lib/assets/flutter_map_logo.png": "208d63cc917af9713fc9572bd5c09362",
"build/web/assets/AssetManifest.json": "2efbb41d7877d10aac9d091f58ccd7b9",
"build/web/assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"build/web/assets/fonts/MaterialIcons-Regular.otf": "e7069dfd19b331be16bed984668fe080",
"build/web/assets/NOTICES": "1c1af7a96477dd23b121bf6b33c55714",
"build/web/assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"build/web/canvaskit/canvaskit.js": "97937cb4c2c2073c968525a3e08c86a3",
"build/web/canvaskit/canvaskit.wasm": "3de12d898ec208a5f31362cc00f09b9e",
"build/web/canvaskit/profiling/canvaskit.js": "c21852696bc1cc82e8894d851c01921a",
"build/web/canvaskit/profiling/canvaskit.wasm": "371bc4e204443b0d5e774d64a046eb99",
"build/web/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"build/web/flutter.js": "a85fcf6324d3c4d3ae3be1ae4931e9c5",
"build/web/icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"build/web/icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"build/web/icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"build/web/icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"build/web/index.html": "2d5d56078980817d38208c96a1a65e96",
"/": "ec35d19b7be7dd6bddc76c83da5df80e",
"build/web/main.dart.js": "939338bf718df780320d9dc48198afa1",
"build/web/manifest.json": "818412b053f494528418032c46698bf2",
"build/web/version.json": "e3cfcadbc6587c86e5a2502ee9380210",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "df3c39275bebcc09c1d13313e7074fbe",
"gourmentcoffee_6a612.iml": "f9bf5c490675c84d098e6772a6f2a796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "eef547088096c383c40aceada7abc8d9",
"lib/main.dart": "ae762add294346fa6a4cf193d30dd8bd",
"main.dart.js": "dc164abbf3f00f0cfdc100f915664aed",
"manifest.json": "cc1e6b9e10d6a7a1c21e369678b3d941",
"public/.dart_tool/dartpad/web_plugin_registrant.dart": "7ed35bc85b7658d113371ffc24d07117",
"public/.dart_tool/flutter_build/a401100882b1f705d80015425aebb9db/app.dill": "46a265d34cb4f11ca05dd11c742422a1",
"public/.dart_tool/flutter_build/a401100882b1f705d80015425aebb9db/app.dill.deps": "16448c967c67364ac7d559498795cd85",
"public/.dart_tool/flutter_build/a401100882b1f705d80015425aebb9db/dart2js.d": "e842f9487d11ded53a1a16b4113c135b",
"public/.dart_tool/flutter_build/a401100882b1f705d80015425aebb9db/dart2js.stamp": "ae0930bd830c5863258d8cc97cb04525",
"public/.dart_tool/flutter_build/a401100882b1f705d80015425aebb9db/flutter_assets.d": "c48de46f8e43e806a20f512858e0d3dd",
"public/.dart_tool/flutter_build/a401100882b1f705d80015425aebb9db/gen_localizations.stamp": "436d2f2faeb7041740ee3f49a985d62a",
"public/.dart_tool/flutter_build/a401100882b1f705d80015425aebb9db/main.dart": "ab7b5407e7bce6f30b69bded14a0155a",
"public/.dart_tool/flutter_build/a401100882b1f705d80015425aebb9db/main.dart.js": "939338bf718df780320d9dc48198afa1",
"public/.dart_tool/flutter_build/a401100882b1f705d80015425aebb9db/main.dart.js.deps": "afafa6fd93327474379649295ab108e9",
"public/.dart_tool/flutter_build/a401100882b1f705d80015425aebb9db/outputs.json": "ae37bf4064c30584d67a6232b8444e3a",
"public/.dart_tool/flutter_build/a401100882b1f705d80015425aebb9db/service_worker.d": "458597de7e6a54e2b9a3010810492107",
"public/.dart_tool/flutter_build/a401100882b1f705d80015425aebb9db/web_entrypoint.stamp": "9ef17f40a3d25e8493c2028fcbceb3b1",
"public/.dart_tool/flutter_build/a401100882b1f705d80015425aebb9db/web_plugin_registrant.dart": "7ed35bc85b7658d113371ffc24d07117",
"public/.dart_tool/flutter_build/a401100882b1f705d80015425aebb9db/web_release_bundle.stamp": "cf9eec4277c8491cdecd7450673875a2",
"public/.dart_tool/flutter_build/a401100882b1f705d80015425aebb9db/web_resources.d": "b6ab84b7716af3cabf92f5d73f18b9f9",
"public/.dart_tool/flutter_build/a401100882b1f705d80015425aebb9db/web_service_worker.stamp": "b77bb74c75a73ebe469a7476e32f55bb",
"public/.dart_tool/flutter_build/a401100882b1f705d80015425aebb9db/web_static_assets.stamp": "436d2f2faeb7041740ee3f49a985d62a",
"public/.dart_tool/package_config.json": "94a9f8d15e15b42db42f01e4c3fd146a",
"public/.dart_tool/package_config_subset": "9d08af0f4fff8cf968143f48e3524e68",
"public/.dart_tool/version": "f7a307d5d6b1748af3468afbea376c25",
"public/.idea/libraries/Dart_SDK.xml": "b1c063a4e609ba87bc7c7200be8b0e78",
"public/.idea/libraries/KotlinJavaRuntime.xml": "de38cfadca3106f8aff5ab15dd81692f",
"public/.idea/modules.xml": "8f04d1672433a5030e6b4e45f5c45ce5",
"public/.idea/runConfigurations/main_dart.xml": "0ecf958af289efc3fc1927aa27a8442f",
"public/.idea/workspace.xml": "25155dfb2368a7e35e1ebbecd505a418",
"public/analysis_options.yaml": "5df212687f3997ccd1310b5b19ebfb78",
"public/build/web/assets/AssetManifest.json": "2efbb41d7877d10aac9d091f58ccd7b9",
"public/build/web/assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"public/build/web/assets/fonts/MaterialIcons-Regular.otf": "e7069dfd19b331be16bed984668fe080",
"public/build/web/assets/NOTICES": "1c1af7a96477dd23b121bf6b33c55714",
"public/build/web/assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"public/build/web/canvaskit/canvaskit.js": "97937cb4c2c2073c968525a3e08c86a3",
"public/build/web/canvaskit/canvaskit.wasm": "3de12d898ec208a5f31362cc00f09b9e",
"public/build/web/canvaskit/profiling/canvaskit.js": "c21852696bc1cc82e8894d851c01921a",
"public/build/web/canvaskit/profiling/canvaskit.wasm": "371bc4e204443b0d5e774d64a046eb99",
"public/build/web/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"public/build/web/flutter.js": "a85fcf6324d3c4d3ae3be1ae4931e9c5",
"public/build/web/icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"public/build/web/icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"public/build/web/icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"public/build/web/icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"public/build/web/index.html": "b0fd0766a1818c62cc9342b9809c7a7b",
"public/build/web/main.dart.js": "939338bf718df780320d9dc48198afa1",
"public/build/web/manifest.json": "818412b053f494528418032c46698bf2",
"public/build/web/version.json": "e3cfcadbc6587c86e5a2502ee9380210",
"public/gourmentcoffee_6a612.iml": "f9bf5c490675c84d098e6772a6f2a796",
"public/lib/main.dart": "ae762add294346fa6a4cf193d30dd8bd",
"public/pubspec.lock": "0dcf288b1fe7d328cafef515660223e4",
"public/pubspec.yaml": "cc6a5940406daacfd4ac6fc2db5c7134",
"public/README.md": "845fbedf41439c0483f0c97a24c4d7e8",
"public/test/widget_test.dart": "876bb48d57ca3371563edb19762c320f",
"public/web/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"public/web/icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"public/web/icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"public/web/icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"public/web/icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"public/web/index.html": "a455e3728cdcbd6ac274618dca1c8196",
"public/web/manifest.json": "818412b053f494528418032c46698bf2",
"pubspec.lock": "0dcf288b1fe7d328cafef515660223e4",
"pubspec.yaml": "cc6a5940406daacfd4ac6fc2db5c7134",
"README.md": "845fbedf41439c0483f0c97a24c4d7e8",
"test/widget_test.dart": "876bb48d57ca3371563edb19762c320f",
"version.json": "794326f50f22423b54828f03fa4013ed",
"web/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"web/icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"web/icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"web/icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"web/icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"web/index.html": "ec35d19b7be7dd6bddc76c83da5df80e",
"web/manifest.json": "818412b053f494528418032c46698bf2"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
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
