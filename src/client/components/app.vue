<template>
  <div>
    <Vue-Header></Vue-Header>
    <router-view></router-view>
    <Vue-Footer></Vue-Footer>
  </div>
</template>

<script lang="coffee">
  import Header from './header.vue'
  import Footer from './footer.vue'

  export default
    components:
      'Vue-Header': Header
      'Vue-Footer': Footer

</script>
