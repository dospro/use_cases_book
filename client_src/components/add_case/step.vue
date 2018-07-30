<template>
    <div class="input-group">
        <span class="input-group-addon"> {{item.index}} </span>
        <input type="text" class="form-control" v-model="item.text">
        <span class="input-group-btn">
            <button class="btn btn-success" title="New Step" v-on:click="addStep">
                <i class="fa fa-plus"></i>
            </button>
        </span>
        <span class="input-group-btn">
            <button class="btn btn-success" title="Remove Step" v-on:click="removeStep">
                <i class="fa fa-remove"></i>
            </button>
        </span>
    </div>
</template>

<script>
    export default {
        props: ['item'],
        methods: {
            addStep: function() {
                this.$emit('add-step');
            },
            removeStep: function() {
                this.$emit('remove-step');
            }
        }
    }
</script>