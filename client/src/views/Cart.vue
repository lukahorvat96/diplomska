<template>
  <v-container grid-list-lg>
    <h1>DRINKS IN CARD</h1>
    <cart-list :items="allInCart"></cart-list>
    <v-btn
      v-if="showPlaceOrder"
      elevation="2"
      color="red"
      tile
      @click="addDrinksToDB()"
    >
      PLACE ORDER
    </v-btn>
    <v-btn
      v-if="showRequestReseipe"
      elevation="2"
      color="red"
      tile
      @click="finishOrder()"
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
      console.log(this.$store.getters.allDrinksInCart);
      return this.$store.getters.allDrinksInCart;
    },
    showPlaceOrder() {
      var cart = this.$store.getters.allDrinksInCart;
      if (cart.length > 0 && this.$store.state.orderPlaced == false)
        return true;
      else if (this.$store.state.orderPlaced == true) {
        var thereIsSomethingChanged = false;
        for (var i = 0; i < this.cart.length; i++) {
          if (cart[i].orderedQuantity != cart[i].quantity)
            thereIsSomethingChanged = true;
        }
        return thereIsSomethingChanged;
      }
      return false;
    },
    showRequestReseipe() {
      if (this.showPlaceOrder == false && this.$store.state.orderPlaced == true)
        return true;
      return false;
    }
  },
  methods: {
    addDrinksToDB() {
      if (this.$store.state.orderPlaced == false) {
        this.$store.dispatch("addOrderDrink", this.cart);
        this.$store.state.orderPlaced = true;
      } else {
        this.$store.dispatch("updateOrderDrink", this.cart);
      }
      for (var i = 0; i < this.cart.length; i++) {
        this.cart[i].orderedQuantity = Number(this.cart[i].quantity);
        this.cart[i].isOrdered = true;
      }
      this.cart = [];

      //
      // this.response = this.$store.state.response;
      //this.cart = [];
      // this.$store.state.drink_cart = [];

      //--this.$socket.emit("newOrderInDatabese");
      this.$router.push("/");
      //--console.log("newOrderInDatabese");
      //;
    },
    finishOrder() {
      //this.$store.commit(CLEAR_CART);
      return false;
    }
  }
};
</script>
