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
      <p class="text-h7">Ordes waiting: {{ totalprice }}</p>
      
      <p class="text-h7">Ordes done: {{ totalprice }}</p>
    </v-app-bar>

    <v-content>
      <router-view> </router-view>
    </v-content>
    <v-footer color="indigo" app>
      <span class="white--text">&copy; 2019</span>
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
    }
  }
};
</script>

<style scoped>
@font-face {
  font-family: "Callovia";
  src: local("Callovia"), url(./fonts/Callovia.ttf) format("truetype");
}
.callovia-font{
  font-family: "Callovia", Helvetica, sans-serif;
}
</style>
