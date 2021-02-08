<template>
  <v-container>
    <h1>NATURAL BEVERAGES</h1>
    <v-divider />
    <product-list :products="allDrinks"></product-list>
  </v-container>
</template>

<script>
import ProductList from "@/components/Products/ProductList.vue";
export default {
  name: "NaturalBeverages",
  components: {
    "product-list": ProductList
  },
  created() {
    this.$store.dispatch("allNaturalBeverages"); //action; commit -> mutation
  },
  computed: {
    allDrinks() {
      return this.$store.getters.allNaturalBeverages;
    }
  }
};
</script>
<style scoped>
h1 {
  margin-bottom: 2%;
  margin-left: 1%;
}
</style>
