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
        <v-divider></v-divider>

        <v-list-item :to="{ name: 'Drink' }">
          <v-list-item-action>
            <v-icon small>fas fa-glass-cheers</v-icon>
          </v-list-item-action>
          <v-list-item-content>
            <v-list-item-title>All drinks</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
        <!-- <v-list-group value="true" no-action>
          <template v-slot:activator>
            <v-list-item-action>
              <v-icon small>fas fa-glass-whiskey</v-icon>
            </v-list-item-action>
            <v-list-item-content>
              <v-list-item-title>Beverages</v-list-item-title>
            </v-list-item-content>
          </template>
        </v-list-group> -->
        <v-list-item :to="{ name: 'HotDrink' }">
          <v-list-item-action>
            <!-- <v-icon small>fas fa-wine-glass-alt</v-icon> -->
          </v-list-item-action>
          <v-list-item-content>
            <v-list-item-title>Hot Drinks</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
        <v-list-item :to="{ name: 'BottledBeverage' }">
          <v-list-item-action>
            <!-- <v-icon small>fas fa-wine-glass-alt</v-icon> -->
          </v-list-item-action>
          <v-list-item-content>
            <v-list-item-title>Bottled beverages</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
        <v-list-item :to="{ name: 'NaturalBeverage' }">
          <v-list-item-action>
            <!-- <v-icon small>fas fa-wine-glass-alt</v-icon> -->
          </v-list-item-action>
          <v-list-item-content>
            <v-list-item-title>Natural Beverages</v-list-item-title>
          </v-list-item-content>
        </v-list-item>

        <v-list-group value="true" no-action>
          <template v-slot:activator>
            <v-list-item-action>
              <!-- <v-icon small>fas fa-beer</v-icon> -->
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
        <v-list-item :to="{ name: 'Wine' }">
          <v-list-item-action>
            <!-- <v-icon small>fas fa-wine-glass-alt</v-icon> -->
          </v-list-item-action>
          <v-list-item-content>
            <v-list-item-title>Wines</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
        <v-list-item :to="{ name: 'Gin' }">
          <v-list-item-action>
            <!-- <v-icon small>fas fa-wine-glass-alt</v-icon> -->
          </v-list-item-action>
          <v-list-item-content>
            <v-list-item-title>Gin</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
        <v-list-item :to="{ name: 'Vodka' }">
          <v-list-item-action>
            <!-- <v-icon small>fas fa-wine-glass-alt</v-icon> -->
          </v-list-item-action>
          <v-list-item-content>
            <v-list-item-title>Vodka</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
        <v-divider></v-divider>

        <v-list-item :to="{ name: 'Food' }">
          <v-list-item-action>
            <v-icon small>fas fa-utensils</v-icon>
          </v-list-item-action>
          <v-list-item-content>
            <v-list-item-title>All foods</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
        <v-list-item :to="{ name: 'Starter' }">
          <v-list-item-action> </v-list-item-action>
          <v-list-item-content>
            <v-list-item-title>Starters</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
        <v-list-item :to="{ name: 'Soup' }">
          <v-list-item-action> </v-list-item-action>
          <v-list-item-content>
            <v-list-item-title>Soups</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
        <v-list-item :to="{ name: 'Salad' }">
          <v-list-item-action> </v-list-item-action>
          <v-list-item-content>
            <v-list-item-title>Salads</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
        <v-list-item :to="{ name: 'Pasta' }">
          <v-list-item-action> </v-list-item-action>
          <v-list-item-content>
            <v-list-item-title>Pasta</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
        <v-list-item :to="{ name: 'Rissoto' }">
          <v-list-item-action> </v-list-item-action>
          <v-list-item-content>
            <v-list-item-title>Rissoto</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
        <v-list-item :to="{ name: 'Pizza' }">
          <v-list-item-action> </v-list-item-action>
          <v-list-item-content>
            <v-list-item-title>Pizzas</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
        <v-list-item :to="{ name: 'Meat' }">
          <v-list-item-action> </v-list-item-action>
          <v-list-item-content>
            <v-list-item-title>Meat</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
        <v-list-item :to="{ name: 'PadThai' }">
          <v-list-item-action> </v-list-item-action>
          <v-list-item-content>
            <v-list-item-title>Pad Thai</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
        <v-divider></v-divider>

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
      <v-btn>
        Call waiter!
      </v-btn>
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
      <!-- <v-btn v-on:click="clickButton('DELA!!!!')">Pošlji websocket</v-btn> -->
      <!-- <p>{{ SomeData }}</p> -->
      <v-spacer></v-spacer>
      <div>
        Order status: Not ordered!
      </div>
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
      // var drinkCard = this.$store.getters.allDrinksInCart;
      // var totalDrinkPrice = 0;
      // for (var i = 0; i < drinkCard.length; i++)
      //   totalDrinkPrice = totalDrinkPrice + drinkCard[i].totalPrice;
      return this.$store.getters.getTotalPrice;
    },
    SomeData() {
      console.log("SOME DATA: " + this.$store.getters.getSomeData);
      return this.$store.getters.getSomeData;
    }
  },
  methods: {
    clickButton: function(data) {
      // $socket is socket.io-client instance
      console.log("POSLANO: " + data);
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
