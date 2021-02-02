<template>
  <v-card-actions v-if="isNotInCart">
    <!--ITEM NOT IN CARD-->
    <p class="text-h6 mb-5 mt-5">Count: 0x</p>
    <v-spacer></v-spacer>
    <div>
      <v-btn elevation="2" color="green" tile @click="addToCart(product)"
        >ADD TO CART</v-btn
      >
    </div>
  </v-card-actions>

  <v-card-actions v-else>
    <!--ITEM ALREADY IN CARD -->
    <p class="text-h6 mb-5 mt-5" v-if="setQuantity()">Count: {{ quantity }}x</p>
    <v-spacer></v-spacer>
    <div>
      <v-btn elevation="2" tile @click="addToCart(product)">+</v-btn>
      <v-btn elevation="2" tile @click="removeFromCart(product)">-</v-btn>
      <v-btn elevation="2" color="red" tile @click="removeFromCartAll(product)"
        >REMOVE</v-btn
      >
    </div>
  </v-card-actions>
</template>

<script>
import { ADD_TO_CART, DELETE_FROM_CART } from "@/store/mutation-types";
export default {
  name: "ProductButton",
  props: ["product"],
  data() {
    return {
      cart: [],
      quantity: 0,
      index: -1
    };
  },
  computed: {
    isNotInCart() {
      var cart = this.$store.getters.allOrdersProductById;
      const index2 = cart.findIndex(
        p => p.product_id === this.product.product_id
      );
      if (index2 < 0) return true;
      return false;
    }
  },
  methods: {
    addToCart(product) {
      var priceBefore = product.price * this.quantity;
      console.log("before: " + priceBefore);
      this.quantity = this.quantity + 1;
      var totalPrice = this.quantity * product.price;
      console.log("TotalPrice: " + totalPrice);
      if (this.quantity == 1) {
        this.$store.state.totalPrice += totalPrice;
        product.quantity = Number(this.quantity);
        product.totalPrice = Number(totalPrice);
        this.$store.commit(ADD_TO_CART, product);
      } else {
        this.$store.state.totalPrice -= priceBefore;
        this.$store.state.totalPrice += totalPrice;
        console.log("After totalPriceState: " + this.$store.state.totalPrice);
        //this.$store.commit(DELETE_FROM_CART, product.product_id);
        product.quantity = Number(this.quantity);
        product.totalPrice = Number(totalPrice);
        this.$store.commit(ADD_TO_CART, product);
      }
      console.log("POVEČANO: " + this.quantity);
    },
    removeFromCart(product) {
      var priceBefore = product.price * this.quantity;
      this.quantity = this.quantity - 1;
      var totalPrice = this.quantity * product.price;
      console.log(this.quantity);
      if (this.quantity != 0) {
        //this.$store.commit(DELETE_FROM_CART, product.product_id);
        product.quantity = Number(this.quantity);
        product.totalPrice = Number(totalPrice);
        this.$store.commit(ADD_TO_CART, product);
      } else if (this.quantity == 0) {
        this.$store.commit(DELETE_FROM_CART, product.product_id);
      }
      this.$store.state.totalPrice -= priceBefore;
      this.$store.state.totalPrice += totalPrice;
    },
    setQuantity() {
      this.index = this.$store.state.orderById.findIndex(
        p => p.product_id === this.product.product_id
      );
      this.cart = this.$store.state.orderById;
      if (this.index >= 0) {
        console.log("QUA1:")
        this.quantity = this.cart[this.index].quantity;
        console.log("QUAN: " + this.quantity);
        return true;
      }
      return false;
    },
    removeFromCartAll(product) {
      this.$store.state.totalPrice -=
        this.product.price * this.product.quantity;
      this.$store.commit(DELETE_FROM_CART, product.product_id);
      this.quantity = 0;
    }
  }
};
</script>

<style></style>
