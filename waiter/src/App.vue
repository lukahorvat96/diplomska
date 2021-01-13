<template>
  <v-app id="inspire">
    <v-navigation-drawer v-model="drawer" app>
      <v-list dense flat rounded>
        <v-list-item :to="{ name: 'Home' }">
          <v-list-item-action>
            <v-icon small>fas fa-home</v-icon>
          </v-list-item-action>
          <v-list-item-content>
            <v-list-item-title>Dashboard</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
        <v-list-item :to="{ name: 'Orders' }">
          <v-list-item-action>
            <v-icon small>fas fa-list</v-icon>
          </v-list-item-action>
          <v-list-item-content>
            <v-list-item-title>Orders</v-list-item-title>
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
      </v-list>
    </v-navigation-drawer>

    <v-app-bar app color="indigo" dark>
      <v-app-bar-nav-icon @click.stop="drawer = !drawer" />
      <v-toolbar-title class="callovia-font">RESTAURANT</v-toolbar-title>
      <v-spacer></v-spacer>
      <p class="text-h7">
        Waiting: {{ ordersWaiting }}<br />Done: {{ totalprice }}
      </p>
    </v-app-bar>

    <v-main>
      <router-view> </router-view>
    </v-main>
    <v-footer color="indigo" app>
      <span class="white--text">&copy; 2021</span>
      <v-btn v-on:click="clickButton('WAITERR!!!!')">Pošlji websocket</v-btn>
    </v-footer>
  </v-app>
</template>

<script>
//import HelloWorld from "./components/HelloWorld";

export default {
  name: "App",
  data() {
    return {
      drawer: null
    };
  },
  components: {
    //HelloWorld
  },
  methods: {
    clickButton: function(data) {
      // $socket is socket.io-client instance
      console.log("DELA-WAITER:" + data);
      this.$socket.emit("dodal_v_bazo_waiter", data);
    }
  },
  props: {
    ource: String
  },
  computed: {
    totalprice() {
      var drinkCard = this.$store.getters.allDrinksInCart;
      var totalDrinkPrice = 0;
      for (var i = 0; i < drinkCard.length; i++)
        totalDrinkPrice = totalDrinkPrice + drinkCard[i].totalPrice;
      return totalDrinkPrice;
    },
    ordersWaiting() {
      return this.$store.getters.getAllOrdersWithoutEnd.length;
    }
  }
};
</script>

<style scoped>
@font-face {
  font-family: "Callovia";
  src: local("Callovia"), url(./fonts/Callovia.ttf) format("truetype");
}
.callovia-font {
  font-family: "Callovia", Helvetica, sans-serif;
}
</style>
