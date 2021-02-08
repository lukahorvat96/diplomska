<template>
  <v-container>
    <h1>WATER</h1>
    <v-divider />
    <product-list :products="allDrinks"></product-list>
  </v-container>
</template>

<script>
import ProductList from "@/components/Products/ProductList.vue";
export default {
  name: "Water",
  components: {
    "product-list": ProductList
  },
  created() {
    this.$store.dispatch("allWater"); //action; commit -> mutation
  },
  computed: {
    allDrinks() {
      return this.$store.getters.allWater;
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
