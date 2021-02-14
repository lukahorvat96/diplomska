<template>
  <v-app id="wrapper">
    <div class="text-center">
      <v-dialog v-model="showDialog" width="500">
        <v-card>
          <v-card-title class="headline grey darken-1 proxima_nova-font">
            INFO
          </v-card-title>

          <v-card-text v-if="orderStatus == 'PLACED'" class="proxima_nova-font">
            <br />
            The order has been <b>placed</b>. Wait for the waiter and chef to
            confirm this.
          </v-card-text>
          <v-card-text
            v-if="orderStatus == 'UPDATED'"
            class="proxima_nova-font"
          >
            <br />
            Order has been <b>updated</b>. Wait for the waiter and chef to
            confirm this.
          </v-card-text>
          <v-card-text
            v-if="orderStatus == 'CHANGED'"
            class="proxima_nova-font"
          >
            <br />
            The order was <b>changed</b> by the waiter. Check the cart to see
            what’s different. The reason may be a lack of ingredients.
            <br />
            <br />
            It is <b>IMPORTANT</b> that you must place your order again if you
            agree to the changes.
          </v-card-text>
          <v-card-text
            v-if="orderStatus == 'CONFIRMED'"
            class="proxima_nova-font"
          >
            <br />
            The order was confirmed by the waiter and chef. Wait for us to serve
            you.
          </v-card-text>
          <v-card-text
            v-if="orderStatus == 'INVOICE'"
            class="proxima_nova-font"
          >
            <br />
            The waiter will bring you the bill as soon as possible.
          </v-card-text>

          <v-divider></v-divider>

          <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn color="red" text @click="showDialog = false">
              I understand
            </v-btn>
          </v-card-actions>
        </v-card>
      </v-dialog>
    </div>

    <v-navigation-drawer v-model="drawer" app>
      <v-list dense>
        <v-list-item-group mandatory>
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
          <v-list-item :to="{ name: 'HotDrink' }">
            <v-list-item-action> </v-list-item-action>
            <v-list-item-content>
              <v-list-item-title>Hot Drinks</v-list-item-title>
            </v-list-item-content>
          </v-list-item>
          <v-list-item :to="{ name: 'BottledBeverage' }">
            <v-list-item-action> </v-list-item-action>
            <v-list-item-content>
              <v-list-item-title>Bottled beverages</v-list-item-title>
            </v-list-item-content>
          </v-list-item>
          <v-list-item :to="{ name: 'NaturalBeverage' }">
            <v-list-item-action> </v-list-item-action>
            <v-list-item-content>
              <v-list-item-title>Natural Beverages</v-list-item-title>
            </v-list-item-content>
          </v-list-item>

          <v-list-group mandatory no-action>
            <template v-slot:activator>
              <v-list-item-action> </v-list-item-action>
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
            <v-list-item-action> </v-list-item-action>
            <v-list-item-content>
              <v-list-item-title>Wines</v-list-item-title>
            </v-list-item-content>
          </v-list-item>
          <v-list-item :to="{ name: 'Gin' }">
            <v-list-item-action> </v-list-item-action>
            <v-list-item-content>
              <v-list-item-title>Gin</v-list-item-title>
            </v-list-item-content>
          </v-list-item>
          <v-list-item :to="{ name: 'Vodka' }">
            <v-list-item-action> </v-list-item-action>
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
        </v-list-item-group>
      </v-list>
      <template v-slot:append>
        <div class="order_status" v-if="checkOrder()">
          <h4>Table ID: {{ tableID }}</h4>
          <h4>Status: {{ orderStatus }}</h4>
        </div>
      </template>
    </v-navigation-drawer>

    <v-app-bar app color="grey darken-3" dark>
      <v-app-bar-nav-icon @click.stop="drawer = !drawer" />
      <v-toolbar-title class="blacksword-font">RESTAURANT</v-toolbar-title>
      <v-spacer></v-spacer>
      <v-btn
        elevation="2"
        color="gray darken-4"
        tile
        class="proxima_nova-font"
        @click="callWaiter()"
      >
        Call waiter!
      </v-btn>
      <router-link class="routerLink" :to="{ name: 'Cart' }">
        <v-btn elevation="2" color="red" tile class="priceButton">
          Total price: {{ totalprice }}$
        </v-btn>
      </router-link>
    </v-app-bar>

    <v-main>
      <router-view> </router-view>
    </v-main>
    <v-footer padless>
      <v-spacer></v-spacer>

      <v-btn v-for="icon in icons" :key="icon" class="mx-2" icon>
        <v-icon size="24px">
          {{ icon }}
        </v-icon>
      </v-btn>
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
      someData: null,
      showDialog: false,
      icons: ["mdi-facebook", "mdi-instagram"]
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
    },
    orderStatus() {
      if (this.$store.getters.getOrderStatus == "") return "NO ORDER PLACED";
      return this.$store.getters.getOrderStatus;
    },
    tableID() {
      return this.$store.getters.getTableID;
    }
  },
  methods: {
    clickButton: function(data) {
      // $socket is socket.io-client instance
      console.log("POSLANO: " + data);
      this.$socket.emit("dodal_v_bazo", data);
    },
    checkOrder() {
      if (this.$store.getters.getOrderStatus == "UPDATED ORDER") {
        this.showDialog = true;
        this.$store.state.orderStatus = "UPDATED";
      }
      if (this.$store.getters.getOrderStatus == "CHANGED BY WAITER") {
        this.$router.push("/");
        this.showDialog = true;
        this.$store.state.orderStatus = "CHANGED";
      }
      if (this.$store.getters.getOrderStatus == "CONFIRMED BY WAITER") {
        this.$router.push("/");
        this.showDialog = true;
        this.$store.state.orderStatus = "CONFIRMED";
      }
      if (this.$store.getters.getOrderStatus == "PLACED BY CLIENT") {
        this.$router.push("/");
        this.showDialog = true;
        this.$store.state.orderStatus = "PLACED";
      }
      if (this.$store.getters.getOrderStatus == "WAITING FOR INVOICE") {
        this.$router.push("/");
        this.showDialog = true;
        this.$store.state.orderStatus = "INVOICE";
      }
      if (this.$store.getters.getOrderStatus == "ORDER_END") {
        this.$router.push("/");
        this.$store.state.orderStatus = "";
      }
      return true;
    },
    callWaiter() {
      const latest = {
        order_id: this.$store.state.orderID,
        order_status: "CALLING WAITER",
        order_placed: this.$store.state.orderPlaced
      };
      if (this.$store.state.orderPlaced == false)
        this.$store.dispatch("addOrderOnCall", latest);
      if (this.$store.state.orderPlaced == true) {
        this.$store.dispatch("updateOrderStatus", latest);
      }
    }
  }
};
</script>

<style scoped>
@font-face {
  font-family: "Callovia";
  src: local("Callovia"), url(./fonts/Callovia.ttf) format("truetype");
}
@font-face {
  font-family: "Proxima";
  src: local("Proxima"), url(./fonts/Proxima.ttf) format("truetype");
}
@font-face {
  font-family: "Proxima_nova";
  src: local("Proxima_nova"), url(./fonts/Proxima_nova.ttf) format("truetype");
}
@font-face {
  font-family: "Blacksword";
  src: local("Blacksword"), url(./fonts/Blacksword.ttf) format("truetype");
}
.callovia-font {
  font-family: "Callovia", Helvetica, sans-serif;
}
.proxima-font {
  font-family: "Proxima";
}
.proxima_nova-font {
  font-family: "Proxima_nova";
}
.blacksword-font {
  font-family: "Blacksword";
  width: 350px;
}
.routerLink {
  text-decoration: none;
}
.priceButton {
  font-family: "Proxima_nova";
  width: 200px;
}
.order_status {
  font-family: "Proxima_nova";
  margin-left: 5%;
  margin-bottom: 3%;
}
#wrapper {
  width: auto;
  height: auto;
  background-color: rgb(243, 243, 243);
  font-family: "Proxima_nova";
  /* background-image: url(https://thumbs.dreamstime.com/z/wood-texture-table-top-counter-bar-blur-light-gold-bokeh-cafe-restaurant-background-montage-product-display-design-145736850.jpg); */
  /* margin: 0 auto;
  margin-top: 200px;
  border-radius: 10px; */
}
</style>
// rgb(241, 241, 241);// rgb(241, 241, 241);
