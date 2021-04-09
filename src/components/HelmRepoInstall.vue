<template>
  <div class="code-block"><span id="typed"></span></div>
</template>
<script lang="ts">
import { defineComponent, onMounted } from "@vue/composition-api";
import Typed from "typed.js";
import { useContext } from "@nuxtjs/composition-api";

export default defineComponent({
  name: "HelmRepoInstall",
  setup() {
    const { $config } = useContext();

    const typed = () => {
      var typed = new Typed("#typed", {
        strings: [
          `$ helm repo add ${$config.helmRepoName} ${$config.helmRepoUrl}<br>"${$config.helmRepoName}" has been added to your repositories`
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
