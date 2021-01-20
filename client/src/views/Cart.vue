<template>
  <v-container grid-list-lg>
    <h1>CURRENT ACTIVE ORDERS</h1>
    <p>{{ this.orderID }}</p>
    <h1>CART DRINKS</h1>
    <cart-list :items="allInCart"></cart-list>
    <v-btn
      v-if="isEmpty()"
      v-bind="attrs"
      v-on="on"
      elevation="2"
      color="red"
      tile
      @click="addDrinksToDB(cart)"
    >
      PLACE ORDER
    </v-btn>
    <v-btn
      v-if="noOrderYet()"
      v-bind="attrs"
      v-on="on"
      elevation="2"
      color="red"
      tile
      @click="addDrinksToDB(cart)"
    >
      REQUEST RESEIPE
    </v-btn>
    <!-- <p>RESPONSE: {{ response }}</p> -->
  </v-container>
</template>

<script>
//import { CLEAR_CART } from "@/store/mutation-types";
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
      dialog: false,
      orderID: null
    };
  },
  created() {
    this.cart = this.$store.getters.allDrinksInCart;
    this.orderID = this.$store.getters.getOrderID;
  },
  computed: {
    allInCart() {
      return this.$store.getters.allDrinksInCart;
    }
  },
  methods: {
    addDrinksToDB() {
      this.$store.state.orderedDrink = this.cart;
      this.$store.state.orderPlaced = true;

      // this.$store.dispatch("addOrderDrink", this.cart);
      // this.response = this.$store.state.response;
      //this.$store.commit(CLEAR_CART);
      //this.cart = [];
      // this.$store.state.drink_cart = [];

      //--this.$socket.emit("newOrderInDatabese");
      this.$router.push("/");
      //--console.log("newOrderInDatabese");
      //;
    },
    isEmpty() {
      if (this.cart.length == 0) return false;
      else return true;
    },
    noOrderYet() {
      this.orderID = this.$store.getters.getOrderID;
      if (this.orderID == null) return false;
      return true;
    }
  }
};
</script>
