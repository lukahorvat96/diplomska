<template>
  <v-container grid-list-lg>
    <div id="container">
      <h1>CART</h1>
    </div>
    <h3>Table ID: {{ tableID }}</h3>
    <h3>Table name: {{ tableName }}</h3>
    <v-divider />
    <h2>CHANGE TABLE:</h2>
    <v-text-field
      class="textfild"
      label="Table ID"
      hide-details="auto"
      @keydown="onKeydown"
      color="red"
      type="text"
      v-model="table_id"
    ></v-text-field>
    <v-text-field
      class="textfild"
      label="Table Name"
      hide-details="auto"
      color="red"
      type="text"
      v-model="table_name"
    ></v-text-field>
    <v-btn
      elevation="2"
      color="gray darken-4"
      tile
      dark
      class="button"
      @click="changeTableID()"
    >
      CHANGE
    </v-btn>
    <h3 class>{{ table_message }}</h3>
  </v-container>
</template>

<script>
//import { CLEAR_CART } from "@/store/mutation-types";
export default {
  name: "cart",
  components: {},
  data() {
    return {
      table_id: null,
      table_name: null,
      table_message: null
    };
  },
  created() {
    this.cart = this.$store.getters.allProductsInCart;
    this.orderID = this.$store.getters.getOrderID;
  },
  computed: {
    tableID() {
      return this.$store.getters.getTableID;
    },
    tableName() {
      return this.$store.getters.getTableName;
    }
  },
  methods: {
    changeTableID() {
      if (this.table_id != null || this.table_name != null) {
        this.$store.state.table_details[0]["table_id"] = this.table_id;
        this.$store.state.table_details[0]["table_name"] = this.table_name;
        this.table_id = null;
        this.table_name = null;
        this.table_message = "Table successfully changed!";
      }
    },
    onKeydown(event) {
      const char = String.fromCharCode(event.keyCode);
      if (!/[0-9]/.test(char)) {
        event.preventDefault();
      }
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
.textfild {
  margin-left: 1%;
  margin-top: 1%;
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
  margin-top: 1%;
  margin-left: 1%;
  width: 20%;
}
#container {
  height: 100%;
  width: 100%;
  display: flex;
}
</style>
