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
      <v-btn
        :disabled="disableMinus"
        elevation="2"
        tile
        @click="removeFromCart(drink)"
        >-</v-btn
      >
      <v-btn
        :disabled="disableRemove"
        elevation="2"
        color="red"
        tile
        @click="removeFromCartAll(drink)"
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
      quantity: 0,
      orderedQuantity: 0,
      orderedQuantity2: 0,
      index: -1,
      alreadyOrdered: false,
      disablePlus: false,
      disableMinus: false,
      disableRemove: false
    };
  },
  computed: {
    isNotInCart() {
      var cart = this.$store.getters.allCardDrinks;
      const index2 = cart.findIndex(p => p.drink_id === this.drink.drink_id);
      console.log("index: " + index2);
      if (index2 < 0) return true;
      return false;
    }
  },
  methods: {
    addToCart(drink) {
      var priceBefore = drink.price * this.quantity;
      console.log("before: " + priceBefore);
      this.quantity = this.quantity + 1;
      var totalPrice = this.quantity * drink.price;
      console.log("TotalPrice: " + totalPrice);
      this.disableMinus = false;
      if (this.quantity == 1) {
        this.$store.state.totalPrice += totalPrice;
        drink.quantity = Number(this.quantity);
        drink.totalPrice = Number(totalPrice);
        drink.orderedQuantity = Number(this.orderedQuantity2);
        drink.isOrdered = this.alreadyOrdered;
        this.$store.commit(ADD_TO_CART, drink);
      } else {
        this.$store.state.totalPrice -= priceBefore;
        this.$store.state.totalPrice += totalPrice;
        console.log("After totalPriceState: " + this.$store.state.totalPrice);
        //this.$store.commit(DELETE_FROM_CART, drink.drink_id);
        drink.quantity = Number(this.quantity);
        drink.totalPrice = Number(totalPrice);
        drink.orderedQuantity = Number(this.orderedQuantity2);
        drink.isOrdered = this.alreadyOrdered;
        this.$store.commit(ADD_TO_CART, drink);
      }
      console.log("POVEČANO: " + this.quantity);
      if (this.orderPlaced == true && this.orderedQuantity2 == this.quantity)
        this.disableMinus = true;
    },
    removeFromCart(drink) {
      if (this.alreadyOrdered == true && this.orderedQuantity2 == this.quantity)
        this.disableMinus = true;
      else {
        var priceBefore = drink.price * this.quantity;
        this.quantity = this.quantity - 1;
        var totalPrice = this.quantity * drink.price;
        if (this.quantity != 0) {
          //this.$store.commit(DELETE_FROM_CART, drink.drink_id);
          drink.quantity = Number(this.quantity);
          drink.totalPrice = Number(totalPrice);
          drink.orderedQuantity = Number(this.orderedQuantity2);
          drink.isOrdered = this.alreadyOrdered;
          this.$store.commit(ADD_TO_CART, drink);
        } else if (this.quantity == 0) {
          this.$store.commit(DELETE_FROM_CART, drink.drink_id);
        }
        this.$store.state.totalPrice -= priceBefore;
        this.$store.state.totalPrice += totalPrice;
      }
      if (this.alreadyOrdered == true && this.orderedQuantity2 == this.quantity)
        this.disableMinus = true;
    },
    setQuantity() {
      this.index = this.$store.state.cart_drink.findIndex(
        p => p.drink_id === this.drink.drink_id
      );
      if (this.index >= 0) {
        this.alreadyOrdered = this.cart[this.index].isOrdered;
        if (this.alreadyOrdered == true) {
          this.disableRemove = true;
        }
        this.quantity = this.cart[this.index].quantity;
        this.orderedQuantity2 = this.cart[this.index].orderedQuantity;
        console.log("QUAN: " + this.quantity);
        console.log("ORD QUAN: " + this.orderedQuantity2);
        if (
          this.alreadyOrdered == true &&
          this.orderedQuantity2 == this.quantity
        )
          this.disableMinus = true;
        return true;
      }
      return false;
    },
    removeFromCartAll(drink) {
      this.$store.state.totalPrice -= this.drink.price * this.drink.quantity;
      this.$store.commit(DELETE_FROM_CART, drink.drink_id);
      this.quantity = 0;
    }
  }
};
</script>

<style></style>
