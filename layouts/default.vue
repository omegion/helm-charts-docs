<template>
  <div class="">
    <Navbar />
    <Nuxt />
  </div>
</template>

<script lang="ts">
import { defineComponent } from "@vue/composition-api";
import Navbar from "~/components/Navbar.vue";

export default defineComponent({
  name: "default",
  components: { Navbar }
});
</script>
