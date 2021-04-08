<template>
  <div class="">
    <Navbar/>
    <Nuxt/>
    <Footer/>
  </div>
</template>

<script lang="ts">
import {defineComponent} from "@vue/composition-api";
import Navbar from "~/components/Navbar.vue";
import Footer from "~/components/Footer.vue";

export default defineComponent({
  name: "default",
  components: {Footer, Navbar}
});
</script>
