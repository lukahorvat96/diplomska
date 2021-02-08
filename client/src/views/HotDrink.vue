<template>
  <v-container>
    <h1>HOT DRINKS</h1>
    <v-btn class="ml-3">
      Order by price
    </v-btn>
    <product-list :products="allDrinks"></product-list>
  </v-container>
</template>

<script>
import ProductList from "@/components/Products/ProductList.vue";
export default {
  name: "HotDrink",
  components: {
    "product-list": ProductList
  },
  created() {
    this.$store.dispatch("allHotDrinks"); //action; commit -> mutation
  },
  computed: {
    allDrinks() {
      return this.$store.getters.allHotDrinks;
    }
  }
};
</script>
<style scoped>
@font-face {
  font-family: "Proxima";
  src: local("Proxima"), url(../fonts/Proxima.ttf) format("truetype");
}
@font-face {
  font-family: "Proxima_nova";
  src: local("Proxima_nova"), url(../fonts/Proxima_nova.ttf) format("truetype");
}
.proxima-font {
  font-family: "Proxima";
}
h1 {
  font-family: "Proxima_nova";
  margin-bottom: 2%;
  margin-left: 1%;
}
</style>
