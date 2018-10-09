import navigation from  './navigation'
import drawerlayout from  './DrawerLayout.vue'
import host from  './host.vue'
import {load} from  '../plugin/progress'
export default {

  install(weex,vue)
  {
     weex.registerComponent('navigation',navigation)
     weex.registerComponent('drawerlayout',drawerlayout)
     weex.registerComponent('floading',load)
     weex.registerComponent('host',host)
  }
}


