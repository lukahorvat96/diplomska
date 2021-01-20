<template>
  <v-container>
    <h1>{{ this.drinkTypeName }} : {{ drinkTypeID }}</h1>
    <drink-list :drinks="allDrinksByType"></drink-list>
  </v-container>
</template>

<script>
import DrinkList from "@/components/Drinks/DrinkList.vue";
export default {
  name: "DrinkType",
  props: {
    drinkTypeID: {
      type: Number,
      required: true
    }
  },
  data() {
    return {
      drinkTypeName: ""
    }
  },
  components: {
    "drink-list": DrinkList
  },
  created() {
    this.$store.dispatch("allDrinksTypeById", this.drinkTypeID);
  },
  computed: {
    allDrinksByType() {
      return this.$store.getters.allDrinksByType;
    }
  }
};
</script>
