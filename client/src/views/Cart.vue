<template>
  <v-container grid-list-lg>
    <!-- <div class="text-center">
      <v-dialog v-model="paymentDialog" width="500">
        <v-card>
          <v-card-title class="headline grey lighten-2">
            Payment option
          </v-card-title>

          <v-card-text>
            Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do
            eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim
            ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut
            aliquip ex ea commodo consequat. Duis aute irure dolor in
            reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
            pariatur. Excepteur sint occaecat cupidatat non proident, sunt in
            culpa qui officia deserunt mollit anim id est laborum.
          </v-card-text>

          <v-divider></v-divider>

          <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn color="primary" text @click="showDialog = false">
              > I accept
            </v-btn>
          </v-card-actions>
        </v-card>
      </v-dialog>
    </div> -->
    <div id="container">
      <h1>CART</h1>
      <v-spacer />
      <v-btn
        v-if="showPlaceOrder"
        elevation="2"
        color="gray darken-4"
        tile
        dark
        class="button"
        @click="addDrinksToDB()"
      >
        PLACE ORDER
      </v-btn>
      <v-btn
        v-if="showRequestReseipe"
        elevation="2"
        color="gray darken-4"
        tile
        dark
        class="button"
        @click="finishOrder()"
      >
        REQUEST RESEIPE
      </v-btn>
    </div>
    <div v-if="notOrdered">
      <h3>Order number: {{ orderNumber }}</h3>
    </div>
    <v-divider />
    <div v-if="emptyDrinksCart">
      <h2>DRINKS</h2>
      <cart-list :items="allDrinksInCart"></cart-list>
    </div>
    <v-divider />
    <h2>FOODS</h2>

    <cart-list :items="allFoodsInCart"></cart-list>
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
      // paymentDialog: false,
      orderID: null,
      dialog: false
    };
  },
  created() {
    this.cart = this.$store.getters.allProductsInCart;
    this.orderID = this.$store.getters.getOrderID;
  },
  computed: {
    allDrinksInCart() {
      return this.$store.getters.allDrinksInCart;
    },
    emptyDrinksCart() {
      if (this.$store.getters.allDrinksInCart.length != 0) return true;
      else return false;
    },
    allFoodsInCart() {
      return this.$store.getters.allFoodsInCart;
    },
    emptyFoodsCart() {
      if (this.$store.getters.allFoodsInCart.length != 0) return true;
      else return false;
    },
    showPlaceOrder() {
      var cart = this.$store.getters.allProductsInCart;
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
    notOrdered() {
      if (this.$store.getters.getOrderID != null) return true;
      else return false;
    },
    orderNumber() {
      return this.$store.getters.getOrderID;
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
        this.$store.dispatch("addOrder", this.cart);
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
      // this.paymentDialog = true;
      return false;
    }
  }
};
</script>
<style scoped>
h1 {
  margin-bottom: 0%;
  margin-left: 1%;
}
h2 {
  margin-left: 1%;
  margin-top: 1%;
}
h3 {
  margin-left: 1%;
  margin-top: 1%;
  margin-bottom: 1%;
}
.foods {
  margin-top: 2%;
}
#leftThing {
  width: 25%;
}
#rightThing {
  width: 25%;
}
.button {
  width: 20%;
}
#container {
  height: 100%;
  width: 100%;
  display: flex;
}
</style>
