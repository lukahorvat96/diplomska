<template>
  <v-container grid-list-lg>
    <h1>CART DRINKS</h1>
    <cart-list :items="allInCart"></cart-list>
    <v-dialog v-model="dialog" width="500">
      <template v-slot:activator="{ on, attrs }">
        <v-btn
          v-if="isEmpty()"
          
          v-bind="attrs"
          v-on="on"
          elevation="2"
          color="red"
          tile
        >
          FINISH ORDER
        </v-btn>
      </template>
      <v-card>
        <v-card-title class="grey lighten-2">
          Your ourder will be placed.
        </v-card-title>
        <v-divider></v-divider>
        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn @click="addDrinksToDB(cart)" color="primary" text >
            I accept
          </v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
    <!-- <p>RESPONSE: {{ response }}</p> -->
  </v-container>
</template>

<script>
import { CLEAR_CART } from "@/store/mutation-types";
import CartList from "../components/Cart/CartList";
export default {
  name: "cart",
  components: {
    "cart-list": CartList
  },
  data() {
    return {
      cart: [],
      response: "",
      dialog: false
    };
  },
  created() {
    this.cart = this.$store.getters.allDrinksInCart;
  },
  computed: {
    allInCart() {
      return this.$store.getters.allDrinksInCart;
    }
  },
  methods: {
    addDrinksToDB() {
      this.$store.dispatch("addOrderDrink", this.cart);
      this.response = this.$store.state.response;
      this.$store.commit(CLEAR_CART);
      this.cart = [];
      this.dialog = false;
      this.$router.push('/');
    },
    isEmpty() {
      if (this.cart.length == 0) return false;
      else return true;
    }
  }
};
</script>
