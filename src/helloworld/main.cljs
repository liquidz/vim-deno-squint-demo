(ns helloworld.core
  (:require
    ["https://deno.land/x/denops_std@v5.1.0/mod.ts" :as denops]))

(defn- denops-notify [name f args]
  (str "denops#notify('" name "', '" f "', [" args "])"))

(defn- denops-request
  [name f args]
  (str "denops#request('" name "', '" f "', [" args "])"))

(defn- ^:async world
  [denops text]
  (js/await
    (.cmd denops (str "echomsg '" text "'"))))

(defn ^:async main
  [denops]
  (set! (.-dispatcher denops)
        {:hello (fn []
                  (js/Promise.resolve "Hello from Squint!"))
         :world (fn [text]
                  (world denops text))})

  (let [name (.-name denops)]
    (js/await
      (.cmd denops (str "command! SquintHello call "
                        (denops-notify name "world"
                                       (denops-request name "hello" "")))))))
