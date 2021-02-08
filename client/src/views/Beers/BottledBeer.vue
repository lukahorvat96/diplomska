<template>
  <v-container>
    <h1>BOTTLED BEERS</h1>
    <v-divider />
    <product-list :products="allBottledBeer"></product-list>
  </v-container>
</template>

<script>
import ProductList from "@/components/Products/ProductList.vue";
export default {
  name: "BottledBeer",
  components: {
    "product-list": ProductList
  },
  created() {
    this.$store.dispatch("allBottledBeer"); //action; commit -> mutation
  },
  computed: {
    allBottledBeer() {
      return this.$store.getters.allBottledBeer;
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
