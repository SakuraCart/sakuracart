<?php echo $header; ?>

<section class="box_content">
	<a name="#top"></a>

	<?php if ($compare_count > '0') { ?>
		<div class="compare_total">
			<a href="<?php echo $compare; ?>" id="compare_total" class="button button_blue"><?php echo $text_compare; ?></a>
		</div>
	<?php } ?>

	<h2 class="box_content">
<!-- <img src="<?php echo $title_heading_image; ?>/image/latest.png" alt="" />&nbsp; -->
		<?php echo $heading_title; ?>
	</h2>

	<?php if ($thumb || $description) { ?>
		<div class="category-info">
		<?php if ($thumb) { ?>
			<div class="image"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" /></div>
		<?php } ?>
		<?php if ($description) { ?>
			<?php echo $description; ?>
		<?php } ?>
		</div>
	<?php } ?>

	<?php if ($categories) { ?>
		<div class="list">
			<?php if (count($categories) <= 5) { ?>
				<ul>
					<?php foreach ($categories as $category) { ?>
						<li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
					<?php } ?>
				</ul>
			<?php } else { ?>
				<?php for ($i = 0; $i < count($categories);) { ?>
					<ul>
						<?php $j = $i + ceil(count($categories) / 4); ?>
						<?php for (; $i < $j; $i++) { ?>
							<?php if (isset($categories[$i])) { ?>
								<li><a href="<?php echo $categories[$i]['href']; ?>"><?php echo $categories[$i]['name']; ?></a></li>
							<?php } ?>
						<?php } ?>
					</ul>
				<?php } ?>
			<?php } ?>
		</div>
	<?php } ?>

<?php if ($products) { ?>
	<div class="filter">
		<div class="display">
			<?php echo $text_display; ?>
			<?php echo $text_list; ?>
			/
			<a onclick="display('grid');"><?php echo $text_grid; ?></a>
		</div>
		<div class="limit"><?php echo $text_limit; ?>
			<select onchange="location = this.value;">
				<?php foreach ($limits as $limits) { ?>
					<?php if ($limits['value'] == $limit) { ?>
						<option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
					<?php } else { ?>
						<option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
					<?php } ?>
				<?php } ?>
			</select>
		</div>
		<div class="sort"><?php echo $text_sort; ?>
			<select onchange="location = this.value;">
				<?php foreach ($sorts as $sorts) { ?>
					<?php if ($sorts['value'] == $sort . '-' . $order) { ?>
						<option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
					<?php } else { ?>
						<option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
					<?php } ?>
				<?php } ?>
			</select>
		</div>
	</div>

	<div class="list">
		<?php foreach ($products as $product) { ?>

			<div>
				<?php if ($product['thumb']) { ?>
					<div class="image">
						<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" /></a>
					</div>
				<?php } ?>

				<div class="name">
					<a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
				</div>

				<div class="description">
					<?php echo $product['description']; ?>
				</div>

				<?php if ($product['rating']) { ?>
					<div class="rating">
						<img src="<?php echo ICON; ?>stars/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" />
					</div>
				<?php } ?>

				<?php if ($product['price']) { ?>
					<div class="price">
						<?php if ($product['tax']) { ?>
							<span class="price-tax"><?php echo $text_tax; ?>
								<?php echo $product['tax']; ?>
								<br />
							</span>
						<?php } ?>
						<?php if (!$product['special']) { ?>
							<?php echo $product['price']; ?>
							<br />
						<?php } else { ?>
							<span class="price-old"><?php echo $text_regular_price; ?> <?php echo $product['price']; ?></span>
							<br />
							<span class="price-new"><?php echo $text_sale_price; ?> <?php echo $product['special']; ?></span>
						<?php } ?>
					</div>
				<?php } ?>

				<div class="cart">
					<a onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button button_green"><?php echo $button_cart; ?></a>
				</div>

				<div class="wishlist">
					<a onclick="addToWishList('<?php echo $product['product_id']; ?>');" class="button button_blue"><?php echo $button_wishlist; ?></a>
				</div>

				<div class="compare">
					<a onclick="addToCompare('<?php echo $product['product_id']; ?>');" class="button button_blue"><?php echo $button_compare; ?></a>
				</div>

			</div>
		<?php } ?>
	</div>

	<div class="pagination"><?php echo $pagination; ?></div>

<?php } else { ?>
	<div class="content"><?php echo $text_empty; ?></div>
<?php }?>

<script language="javascript" type="text/javascript">
	var text_display = '<?php echo $text_display; ?>';
	var text_list = '<?php echo $text_list; ?>';
	var text_grid = '<?php echo $text_grid; ?>';
</script>

	<div class="button_container container_grey">
		<a href="#top" class="button button_blue left" rel="nofollow"><?php echo $button_top; ?></a>
		<a href="<?php echo $continue; ?>" class="button button_blue right"><?php echo $button_home; ?></a>
	</div>

</section>


<?php if ($content_center) { ?>
	<div id="content">
		<?php echo $content_center; ?>
	</div>
<?php } ?>

<?php echo $footer; ?>