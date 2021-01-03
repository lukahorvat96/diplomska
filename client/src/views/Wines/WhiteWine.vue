<template>
  <v-container>
    <h1>Bottled beers</h1>
    <drink-list :drinks="allBottledBeer"></drink-list>
  </v-container>
</template>

<script>
import DrinkList from "@/components/Drinks/DrinkList.vue";
export default {
  name: "BottledBeer",
  components: {
    "drink-list": DrinkList
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
