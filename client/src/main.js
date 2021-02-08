import Vue from "vue";
import App from "./App.vue";
import router from "./router";
import store from "./store";
import vuetify from "./plugins/vuetify";
import moment from "moment";
import VueSocketIO from "vue-socket.io";
import SocketIO from "socket.io-client";

Vue.config.productionTip = false;

Vue.prototype.moment = moment;
Vue.config.productionTip = false;

Vue.use(
  new VueSocketIO({
    debug: true,
    connection: SocketIO("http://192.168.1.13:5000"),
    vuex: {
      store,
      actionPrefix: "SOCKET_",
      mutationPrefix: "SOCKET_"
    },
    data() {
      return {
        myStyle: {
          backgroundColor: "#05d"
        }
      };
    }
  })
);

new Vue({
  router,
  store,
  vuetify,
  render: h => h(App)
}).$mount("#app");
