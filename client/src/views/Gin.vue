<template>
  <v-container>
    <h1>GIN</h1>
    <v-divider />
    <product-list :products="allDrinks"></product-list>
  </v-container>
</template>

<script>
import ProductList from "@/components/Products/ProductList.vue";
export default {
  name: "Gin",
  components: {
    "product-list": ProductList
  },
  created() {
    this.$store.dispatch("allGin"); //action; commit -> mutation
  },
  computed: {
    allDrinks() {
      return this.$store.getters.allGin;
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
