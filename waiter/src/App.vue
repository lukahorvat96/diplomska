<template>
  <v-app id="wrapper">
    <v-navigation-drawer v-model="drawer" app>
      <v-list dense>
        <v-list-item-group mandatory>
          <v-list-item :to="{ name: 'Home' }">
            <v-list-item-action>
              <v-icon small>fas fa-home</v-icon>
            </v-list-item-action>
            <v-list-item-content>
              <v-list-item-title>Dashboard</v-list-item-title>
            </v-list-item-content>
          </v-list-item>
          <v-list-item v-if="waiter" :to="{ name: 'Orders' }">
            <v-list-item-action>
              <v-icon small>fas fa-list</v-icon>
            </v-list-item-action>
            <v-list-item-content>
              <v-list-item-title>All Orders</v-list-item-title>
            </v-list-item-content>
          </v-list-item>
          <!-- <v-list-item v-if="waiter" :to="{ name: 'Orders' }">
          <v-list-item-action>
            <v-icon small>fas fa-border-all</v-icon>
          </v-list-item-action>
          <v-list-item-content>
            <v-list-item-title>Orders by table</v-list-item-title>
          </v-list-item-content>
        </v-list-item> -->
          <v-list-item v-if="coocker" :to="{ name: 'OrdersFood' }">
            <v-list-item-action>
              <v-icon small>fas fa-border-all</v-icon>
            </v-list-item-action>
            <v-list-item-content>
              <v-list-item-title>Food orders</v-list-item-title>
            </v-list-item-content>
          </v-list-item>
          <v-list-item
            v-if="login"
            v-on:click="logout()"
            :to="{ name: 'Home' }"
          >
            <v-list-item-action>
              <v-icon small>fas fa-sign-out-alt</v-icon>
            </v-list-item-action>
            <v-list-item-content>
              <v-list-item-title>Sign out</v-list-item-title>
            </v-list-item-content>
          </v-list-item>
          <!--
        <v-list-group value="true">
          <template v-slot:activator>
            <v-list-item-action>
              <v-icon small>fas fa-beer</v-icon>
            </v-list-item-action>
            <v-list-item-title>Beer</v-list-item-title>
          </template>
        </v-list-group>
        -->
        </v-list-item-group>
      </v-list>
      <template v-slot:append>
        <div class="login_status" v-if="login">
          <h4>Username: {{ username }}</h4>
        </div>
      </template>
    </v-navigation-drawer>

    <v-app-bar app color="grey darken-3" dark>
      <v-app-bar-nav-icon @click.stop="drawer = !drawer" />
      <v-toolbar-title class="blacksword-font">RESTAURANT</v-toolbar-title>
      <v-spacer></v-spacer>
      <div v-if="login" class="orders">
        <div v-if="waiter">
          Waiting: {{ ordersWaiting }}<br />Done: {{ ordersDone }}
        </div>
      </div>
    </v-app-bar>

    <v-main>
      <router-view> </router-view>
    </v-main>
    <v-footer padless>
      <v-spacer></v-spacer>

      <v-btn v-for="icon in icons" :key="icon" class="mx-2" icon>
        <v-icon size="24px">
          {{ icon }}
        </v-icon>
      </v-btn>
    </v-footer>
  </v-app>
</template>

<script>
//import HelloWorld from "./components/HelloWorld";
import { LOGOUT } from "@/store/mutation-types";
export default {
  name: "App",
  data() {
    return {
      drawer: null,
      icons: ["mdi-facebook", "mdi-instagram"]
    };
  },
  components: {
    //HelloWorld
  },
  methods: {
    logout: function() {
      this.$store.dispatch("logoutUser");
      this.$store.commit(LOGOUT);
    }
  },
  props: {
    ource: String
  },
  computed: {
    ordersDone() {
      return this.$store.getters.getOrdersDone;
    },
    ordersWaiting() {
      return this.$store.getters.getAllOrdersWithoutEnd.length;
    },
    waiter() {
      return this.$store.getters.isWaiter;
    },
    coocker() {
      return this.$store.getters.isCooker;
    },
    login() {
      return this.$store.getters.getIsLogin;
    },
    username() {
      return this.$store.getters.loginUsername;
    }
  }
};
</script>
<style scoped>
@font-face {
  font-family: "Callovia";
  src: local("Callovia"), url(./fonts/Callovia.ttf) format("truetype");
}
@font-face {
  font-family: "Proxima";
  src: local("Proxima"), url(./fonts/Proxima.ttf) format("truetype");
}
@font-face {
  font-family: "Proxima_nova";
  src: local("Proxima_nova"), url(./fonts/Proxima_nova.ttf) format("truetype");
}
@font-face {
  font-family: "Blacksword";
  src: local("Blacksword"), url(./fonts/Blacksword.ttf) format("truetype");
}
.callovia-font {
  font-family: "Callovia", Helvetica, sans-serif;
}
.proxima-font {
  font-family: "Proxima";
}
.proxima_nova-font {
  font-family: "Proxima_nova";
}
.blacksword-font {
  font-family: "Blacksword";
  width: 350px;
}
.routerLink {
  text-decoration: none;
}
.mx-auto {
  font-family: "Proxima_nova";
}
.priceButton {
  font-family: "Proxima_nova";
  width: 200px;
}
.login_status {
  font-family: "Proxima_nova";
  margin-left: 5%;
  margin-bottom: 3%;
}
.orders {
  width: 80px;
}
#wrapper {
  width: auto;
  height: auto;
  background-color: rgb(243, 243, 243);
  font-family: "Proxima_nova";
  /* background-image: url(https://thumbs.dreamstime.com/z/wood-texture-table-top-counter-bar-blur-light-gold-bokeh-cafe-restaurant-background-montage-product-display-design-145736850.jpg); */
  /* margin: 0 auto;
  margin-top: 200px;
  border-radius: 10px; */
}
</style>
