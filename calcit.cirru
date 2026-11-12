
{}
  :about "|Machine-generated snapshot. Do not edit directly — changes will be overwritten. Use `calcit query` to inspect and `calcit edit`/`calcit tree` to modify. Run `calcit docs agents --contract` before mutations; use `--full` for first orientation or changed contract digest. Manual edits must follow format and schema conventions, then run `calcit edit format`."
  :package |app
  :entries $ {} $ :default
    {} (:description |) (:init-fn 'app.main/main!) (:mode :js) (:reload-fn 'app.main/reload!) (:target :browser)
      :feature-policy $ {}
      :modules $ [] |touch-control/ |pointed-prompt/ |quatrefoil/ |quaternion/ |js-ffi/
      :type-slots $ {}
  :files $ {}
    'app.comp.container $ %{} 'FileEntry
      :defs $ {}
        'comp-container $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defcomp comp-container ()
            scene ({}) (comp-demo)
              ambient-light $ {} (:color 0x666666) (:intensity 8)
              ; point-light $ {} (:color 0xffffff) (:intensity 1.4) (:distance 200)
                :position $ [] 20 40 50
              ; point-light $ {} (:color 0xffffff) (:intensity 2) (:distance 200)
                :position $ [] 0 60 0
          :examples $ []
          :schema $ quote $ Fn (-> quatrefoil.schema/Component) (:features :js-ffi)
        'comp-demo $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defcomp comp-demo ()
            group ({})
              box $ {} (:width 16) (:height 4) (:depth 6)
                :position $ [] -40 0 0
                :material $ {} (:kind :mesh-lambert) (:color 0x808080) (:opacity 0.6)
                :event $ {} $ :click
                  fn (_event d!)
                    hint-fn $ Fn JsObject
                      Fn app.updater/DemoOp Unit $ -> Unit
                      -> Unit
                    d! (app.updater/DemoOp :demo) &unit
              sphere $ {} (:radius 8)
                :position $ [] 10 0 0
                :material $ {} (:kind :mesh-lambert) (:opacity 0.6) (:color 0x9050c0)
                :event $ {} $ :click
                  fn (_event d!)
                    hint-fn $ Fn JsObject
                      Fn app.updater/DemoOp Unit $ -> Unit
                      -> Unit
                    d! (app.updater/DemoOp :canvas) &unit
              group ({})
                text $ {} (:text |Quatrefoil) (:size 4) (:depth 2)
                  :position $ [] -30 0 20
                  :material $ {} (:kind :mesh-lambert) (:color 0xffcccc)
              sphere $ {} (:radius 4) (:emissive 0xffffff) (:metalness 0.8) (:color 0x00ff00) (:emissiveIntensity 1) (:roughness 0)
                :position $ [] -10 20 0
                :material $ {} (:kind :mesh-basic) (:color 0xffff55) (:opacity 0.8) (:transparent true)
                :event $ {} $ :click
                  fn (_event d!)
                    hint-fn $ Fn JsObject
                      Fn app.updater/DemoOp Unit $ -> Unit
                      -> Unit
                    d! (app.updater/DemoOp :canvas) &unit
              point-light $ {} (:color 0xffff55) (:intensity 10) (:distance 200)
                :position $ [] -10 20 0
          :examples $ []
          :schema $ quote $ Fn (-> quatrefoil.schema/Component) (:features :js-ffi)
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.comp.container
          :require
            quatrefoil.alias :refer $ group box sphere point-light ambient-light perspective-camera scene text
            quatrefoil.core :refer $ defcomp
    'app.config $ %{} 'FileEntry
      :defs $ {} $ 'dev?
        %{} 'CodeEntry (:doc |)
          :code $ quote $ def dev?
            = |dev $
              get-env |mode
              , .unwrap-or |release
          :examples $ []
          :schema $ quote Bool
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.config
    'app.main $ %{} 'FileEntry
      :defs $ {}
        '*store $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defref *store
            app.updater/Store :states $ {} $ :cursor ([])
          :examples $ []
          :schema $ quote $ Ref app.updater/Store
        'dispatch! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn dispatch! (op payload)
            match (try-decode-map-as op app.updater/SceneOp)
              (:ok operation)
                reset! *store $ updater @*store operation payload
              (:err message)
                if (list? op) (raise message) (reset! *store @*store)
            , &unit
          :examples $ []
          :schema $ quote $ Fn Op Payload (-> Unit) (:generics Op Payload)
        'main! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn main! ()
            when dev? (load-console-formatter!) (println "|Run in dev mode")
            set-perspective-camera! $ {} (:fov 45)
              :aspect $ / (viewport-width) (viewport-height)
              :near 0.1
              :far 1000
              :position $ [] 0 0 100
            inject-tree-methods
            let
                canvas-el $
                  query-selector |canvas
                  , .unwrap
              init-renderer! canvas-el $ {} $ :background 0x110022
            render-app!
            add-watch! *store :changes $ fn (store prev) (render-app!)
            set! js/window.onkeydown handle-key-event
            render-control!
            handle-control-events
            println "|App started!"
            , &unit
          :examples $ []
          :schema $ quote $ Fn (-> Unit) (:features :js-ffi)
        'reload! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn reload! ()
            if
              not $ nil? build-errors
              hud! |error build-errors
              do (hud! |ok~ nil) (clear-cache!) (clear-control-loop!) (handle-control-events) (remove-watch! *store :changes)
                add-watch! *store :changes $ fn (store prev) (render-app!)
                render-app!
                set! js/window.onkeydown handle-key-event
                println "|Code updated."
            , &unit
          :examples $ []
          :schema $ quote $ Fn (-> Unit) (:features :js-ffi)
        'render-app! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn render-app! () (; println "|Render app:")
            render-canvas! (comp-container) dispatch!
          :examples $ []
          :schema $ quote $ Fn (-> Unit)
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.main
          :require
            |@quatrefoil/utils :refer $ inject-tree-methods
            quatrefoil.core :refer $ render-canvas! *global-tree clear-cache! init-renderer! handle-key-event handle-control-events
            app.comp.container :refer $ comp-container
            |three :as THREE
            touch-control.core :refer $ render-control! start-control-loop! clear-control-loop!
            |bottom-tip :default hud!
            |./calcit.build-errors :default build-errors
            app.config :refer $ dev?
            quatrefoil.dsl.object3d-dom :refer $ set-perspective-camera!
            js-ffi.browser :refer $ viewport-width viewport-height query-selector
            app.updater :refer $ updater
    'app.updater $ %{} 'FileEntry
      :defs $ {}
        'DemoOp $ %{} 'CodeEntry
          :doc "|The demo click examples send operations without application data."
          :code $ quote $ defenum DemoOp (:demo) (:canvas)
          :examples $ []
          :schema $ quote EnumDef
        'SceneOp $ %{} 'CodeEntry
          :doc "|Typed demo operations, existing Tag operations, or a direct cursor."
          :code $ quote $ defunion SceneOp DemoOp Tag (List Tag)
          :examples $ []
          :schema $ quote UnionDef
        'Store $ %{} 'CodeEntry
          :doc "|The template's store owns one extensible Quatrefoil state tree."
          :code $ quote $ defstruct Store
            :states $ Map Tag Dynamic
          :examples $ []
          :schema $ quote StructDef
        'update-store-states $ %{} 'CodeEntry
          :doc "|Adapt the Quatrefoil state pair to the template's Store."
          :code $ quote $ defn update-store-states (store pair)
            decode-map-as
              update-states
                {} $ :states $ :states store
                , pair
              , Store
          :examples $ []
          :schema $ quote $ Fn Store Pair (-> Store) (:generics Pair)
        'updater $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn updater (store op payload)
            match op
              (DemoOp _) store
              (Tag tag)
                if (= tag :states) (update-store-states store payload) store
              (List cursor)
                update-store-states store $ [] cursor payload
          :examples $ []
          :schema $ quote $ Fn Store SceneOp Payload (-> Store) (:generics Payload)
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.updater
          :require $ quatrefoil.cursor :refer $ update-states
