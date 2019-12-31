<script>
    let clicks = 0;
    const handleClick = () => clicks++;
</script>

<style>
    .main {
        height: 100vh;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
    }

    .main * {
        font-size: 2rem;
    }
</style>

<div class="main">
    <div>Number of clicks: {clicks}</div>
    <input type="button" value="Click me" on:click={handleClick} >
</div>