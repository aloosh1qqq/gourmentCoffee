<html>
  <head>
   
    <script src="flutter.js" defer></script>
  </head>
  <body>
    <script>
      window.addEventListener('load', function (ev) {
        // Download main.dart.js
        _flutter.loader.loadEntrypoint({
          serviceWorker: {
            serviceWorkerVersion: serviceWorkerVersion,
          },
          onEntrypointLoaded: async function(engineInitializer) {
            // Initialize the Flutter engine
            let appRunner = await engineInitializer.initializeEngine();
            // Run the app
            await appRunner.runApp();
          }
        })
      });
    </script>
  </body>
</html>
