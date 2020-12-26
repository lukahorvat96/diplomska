<template>
  <v-card>
    <v-img
      class="white--text align-end"
      height="200px"
      v-bind:src="'http://127.0.0.1/img/' + drink.picture"
    >
    </v-img>
    <v-card-title class="headline" dark="1"> {{ drink.name }} </v-card-title>
    <v-card-text class="text--primary">
      <v-row align="center" class="mx-0">
        <v-rating
          :value="4.5"
          color="amber"
          dense
          half-increments
          readonly
          size="14"
        ></v-rating>

        <div class="grey--text ml-4">
          4.5 (413)
        </div>
      </v-row>

      <div class="my-4">
        Small plates, salads & sandwiches - an intimate setting with 12 indoor
        seats plus patio seating. ###OPIS
      </div>

      <p>Size: {{ drink.size }}</p>
      <p class="text-h5 mb-6">{{ drink.price }}$</p>
      <v-divider class="mx-4"></v-divider>
      <drink-button :drink="drink"></drink-button>
    </v-card-text>
    <!-- <v-card-actions>
      <v-btn @click="show = !show" text
        >Add something else
        <v-icon>{{ show ? "mdi-chevron-up" : "mdi-chevron-down" }}</v-icon>
      </v-btn>
    </v-card-actions>
    <v-expand-transition>
      <div v-show="show">
        <v-divider></v-divider>
        <v-card-text>
          I'm a thing. But, like most politicians, he promised more than he
          could deliver. You won't have time for sleeping, soldier, not with all
          the bed making you'll be doing. Then we'll go with that data file!
          Hey, you add a one and two zeros to that or we walk! You're going to
          do his laundry? I've got to find a way to escape.
        </v-card-text>
      </div>
    </v-expand-transition>-->
  </v-card>
</template>

<script>
import DrinkButton from "@/components/Drinks/DrinkButton";
export default {
  name: "DrinkDetail",
  props: ["drink"],
  components: {
    "drink-button": DrinkButton
  },
  data: () => ({
    show: false
  })
};
</script>

<style lang="scss" scoped>
.headline {
  color: black;
}
</style>
