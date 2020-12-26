<template>
  <v-container>
    <h1>COCKTAILS</h1>
    <drink-list :drinks="allCocktails"></drink-list>
  </v-container>
</template>

<script>
import DrinkList from "@/components/Drinks/DrinkList.vue";
export default {
  name: "drink",
  components: {
    "drink-list": DrinkList
  },
  created() {
    this.$store.dispatch("allCocktails"); //action; commit -> mutation
  },
  computed: {
    allCocktails() {
      return this.$store.getters.allCocktails
    }
  }
};
</script>
