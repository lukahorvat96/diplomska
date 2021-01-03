<template>
  <v-container>
    <h1>DRINKS</h1>
    <drink-list :drinks="allDrinks"></drink-list>
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
    this.$store.dispatch("allDrinks"); //action; commit -> mutation
  },
  computed: {
    allDrinks() {
      return this.$store.getters.allDrinks;
    }
  }
};
</script>
