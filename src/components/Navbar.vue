<template>
  <b-navbar type="is-primary-dark" wrapper-class="container">
    <template #brand>
      <b-navbar-item tag="router-link" :to="{ path: '/' }">
        <a href="#" class="has-text-weight-bold is-size-5 has-text-white">
          Helm Charts
        </a>
      </b-navbar-item>
    </template>
    <template #start></template>

    <template #end>
      <b-navbar-item tag="div">
        <div class="buttons">
          <b-button type="is-primary-dark" icon-left="github" tag="a" :href="githubRepo">
            <span>GitHub</span>
          </b-button>
        </div>
      </b-navbar-item>
    </template>
  </b-navbar>
</template>
<script lang="ts">
import {computed, defineComponent} from "@vue/composition-api";
import {useContext} from "@nuxtjs/composition-api";

export default defineComponent({
  name: "Navbar",
  setup() {
    const {$config} = useContext()

    const githubRepo = computed(() => $config.githubRepository)

    return {githubRepo}
  }
});
</script>
