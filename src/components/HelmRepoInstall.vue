<template>
  <div class="code-block"><span id="typed"></span></div>
</template>
<script lang="ts">
import { defineComponent, onMounted } from "@vue/composition-api";
import Typed from "typed.js";

export default defineComponent({
  name: "HelmRepoInstall",
  setup() {
    const typed = () => {
      var typed = new Typed("#typed", {
        strings: [
          '$ helm repo add omegion https://charts.omegion.dev<br>"omegion" has been added to your repositories'
        ],
        typeSpeed: 10
      });
    };

    onMounted(() => {
      typed();
    });
  }
});
</script>
