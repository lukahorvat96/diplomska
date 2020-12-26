<template>
  <v-container grid-list-lg>
    <h1>CART DRINKS</h1>
    <cart-list :items="allInCart"></cart-list>
    <v-btn @click="addDrinksToDB(cart)">
      FINISH ORDER
    </v-btn>
    <p>RESPONSE: {{ response }}</p>
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
      response: ""
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
      if (this.cart.length > 0){
        this.$store.dispatch("addOrderDrink", this.cart);
        this.response = this.$store.state.response;
        this.$store.commit(CLEAR_CART);
        this.cart = [];
      }
    }
  }
};
</script>
