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
        <v-list-item :to="{ name: 'Drink' }">
          <v-list-item-action>
            <v-icon small>fas fa-glass-cheers</v-icon>
          </v-list-item-action>
          <v-list-item-content>
            <v-list-item-title>All drinks</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
        <v-list-group value="true" no-action>
          <template v-slot:activator>
            <v-list-item-action>
              <v-icon small>fas fa-glass-whiskey</v-icon>
            </v-list-item-action>
            <v-list-item-content>
              <v-list-item-title>Beverages</v-list-item-title>
            </v-list-item-content>
          </template>
          <!-- <v-list-item :to="{ name: 'Drinks' }">
            <v-list-item-content>
              <v-list-item-title> Juice </v-list-item-title>
            </v-list-item-content>
          </v-list-item>
          <v-list-item :to="{ name: 'Cocktails' }">
            <v-list-item-content>
              <v-list-item-title> Water </v-list-item-title>
            </v-list-item-content>
          </v-list-item> -->
        </v-list-group>

        <v-list-group value="true" no-action>
          <template v-slot:activator isA>
            <v-list-item-action>
              <v-icon small>fas fa-beer</v-icon>
            </v-list-item-action>
            <v-list-item-content>
              <v-list-item-title>Beers</v-list-item-title>
            </v-list-item-content>
          </template>
          <v-list-item :to="{ name: 'BottledBeer' }">
            <v-list-item-content>
              <v-list-item-title> Bottled </v-list-item-title>
            </v-list-item-content>
          </v-list-item>
          <v-list-item :to="{ name: 'DraughtBeer' }">
            <v-list-item-content>
              <v-list-item-title> Draught </v-list-item-title>
            </v-list-item-content>
          </v-list-item>
          <v-list-item :to="{ name: 'Cider' }">
            <v-list-item-content>
              <v-list-item-title> Cider </v-list-item-title>
            </v-list-item-content>
          </v-list-item>
        </v-list-group>

        <v-list-group value="true" no-action>
          <template v-slot:activator>
            <v-list-item-action>
              <v-icon small>fas fa-wine-glass-alt</v-icon>
            </v-list-item-action>
            <v-list-item-content>
              <v-list-item-title>Wines</v-list-item-title>
            </v-list-item-content>
          </template>
          <v-list-item :to="{ name: 'WhiteWine' }">
            <v-list-item-content>
              <v-list-item-title> White </v-list-item-title>
            </v-list-item-content>
          </v-list-item>
          <v-list-item :to="{ name: 'OrangeWine' }">
            <v-list-item-content>
              <v-list-item-title> Orange </v-list-item-title>
            </v-list-item-content>
          </v-list-item>
          <v-list-item :to="{ name: 'RoseWine' }">
            <v-list-item-content>
              <v-list-item-title> Rose </v-list-item-title>
            </v-list-item-content>
          </v-list-item>
          <v-list-item :to="{ name: 'RedWine' }">
            <v-list-item-content>
              <v-list-item-title> Red </v-list-item-title>
            </v-list-item-content>
          </v-list-item>
          <v-list-item :to="{ name: 'SparklingWine' }">
            <v-list-item-content>
              <v-list-item-title> Sparkling </v-list-item-title>
            </v-list-item-content>
          </v-list-item>
        </v-list-group>
        <v-list-item :to="{ name: 'Cart' }">
          <v-list-item-action>
            <v-icon small>fas fa-shopping-cart</v-icon>
          </v-list-item-action>
          <v-list-item-content>
            <v-list-item-title>Cart</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
      </v-list>
    </v-navigation-drawer>

    <v-app-bar app color="indigo" dark>
      <v-app-bar-nav-icon @click.stop="drawer = !drawer" />
      <v-toolbar-title class="callovia-font">RESTAURANT</v-toolbar-title>
      <v-spacer></v-spacer>
      <router-link class="routerLink" :to="{ name: 'Cart' }">
        <v-btn elevation="2" color="red" tile>
          Total price: {{ totalprice }} €
        </v-btn>
      </router-link>
    </v-app-bar>

    <v-main>
      <router-view> </router-view>
    </v-main>
    <v-footer color="indigo" app>
      <span class="white--text">&copy; 2021</span>
      <v-btn v-on:click="clickButton('DELA!!!!')">Pošlji websocket</v-btn>
      <p>{{ SomeData }}</p>
    </v-footer>
  </v-app>
</template>

<script>
//import HelloWorld from "./components/HelloWorld";

export default {
  name: "App",
  data() {
    return {
      drawer: null,
      someData: null
    };
  },
  components: {
    //HelloWorld
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
    SomeData() {
      console.log("SOME DATA: " + this.$store.getters.getSomeData);
      return this.$store.getters.getSomeData;
    }
  },
  methods: {
    clickButton: function(data) {
      // $socket is socket.io-client instance
      console.log("POSLANO: "+data)
      this.$socket.emit("dodal_v_bazo", data);
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
.routerLink {
  text-decoration: none;
}
</style>
