<template>
  <v-card-actions v-if="isNotInCart">
    <!--ITEM NOT IN CARD-->
    <p class="text-h6 mb-5 mt-5">Count: 0x</p>
    <v-spacer></v-spacer>
    <div>
      <v-btn elevation="2" color="green" tile @click="addToCart(drink)"
        >ADD TO CART</v-btn
      >
    </div>
  </v-card-actions>

  <v-card-actions v-else>
    <!--ITEM ALREADY IN CARD -->
    <p class="text-h6 mb-5 mt-5" v-if="setQuantity()">Count: {{ quantity }}x</p>
    <v-spacer></v-spacer>
    <div>
      <v-btn elevation="2" tile @click="addToCart(drink)">+</v-btn>
      <v-btn elevation="2" tile @click="removeFromCart(drink)">-</v-btn>
      <v-btn elevation="2" color="red" tile @click="removeFromCartAll(drink)"
        >REMOVE</v-btn
      >
    </div>
  </v-card-actions>
</template>

<script>
import { ADD_TO_CART, DELETE_FROM_CART } from "@/store/mutation-types";
export default {
  name: "DrinkButton",
  props: ["drink"],
  data() {
    return {
      cart: this.$store.state.cart_drink,
      quantity: 0
    };
  },
  computed: {
    isNotInCart() {
      const index = this.$store.state.cart_drink.findIndex(
        p => p.drink_id === this.drink.drink_id
      );
      if (index < 0) return true;
      return false;
    }
  },
  methods: {
    addToCart(drink) {
      this.quantity = this.quantity + 1;
      var totalPrice = this.quantity * this.drink.price;
      if (this.quantity == 1) {
        this.drink.quantity = Number(this.quantity);
        this.drink.totalPrice = Number(totalPrice);
        this.$store.commit(ADD_TO_CART, this.drink);
      } else {
        this.$store.commit(DELETE_FROM_CART, drink.drink_id);
        this.drink.quantity = Number(this.quantity);
        this.drink.totalPrice = Number(totalPrice);
        this.$store.commit(ADD_TO_CART, this.drink);
      }
    },
    removeFromCart(drink) {
      this.quantity = this.quantity - 1;
      var totalPrice = this.quantity * this.drink.price;
      if (this.quantity != 0) {
        this.$store.commit(DELETE_FROM_CART, drink.drink_id);
        this.drink.quantity = Number(this.quantity);
        this.drink.totalPrice = Number(totalPrice);
        this.$store.commit(ADD_TO_CART, this.drink);
      } else if (this.quantity == 0) {
        this.$store.commit(DELETE_FROM_CART, drink.drink_id);
      }
    },
    setQuantity() {
      const index = this.$store.state.cart_drink.findIndex(
        p => p.drink_id === this.drink.drink_id
      );
      if (index >= 0) {
        this.quantity = this.cart[index].quantity;
        return true;
      }
      return false;
    },
    removeFromCartAll(drink) {
      this.$store.commit(DELETE_FROM_CART, drink.drink_id);
      this.quantity = 0;
    }
  }
};
</script>

<style></style>
