<?php echo $header; ?>

	<div class="row">
		<div class="col12 last">

<section class="box_content rounded_corners_all border_green">
	<h2 class="box_content rounded_corners_all border_blue gradient_blue">
		<img src="<?php echo ICON; ?>32/length.png" alt="lock" /> <?php echo $heading_title; ?>
	</h2>

	<div id="content">

		<?php if ($error_warning) { ?>
			<div class="warning"><?php echo $error_warning; ?></div>
		<?php } ?>
		<?php if ($success) { ?>
			<div class="success"><?php echo $success; ?></div>
		<?php } ?>

		<form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form">

			<?php if ($length_classes) { ?>
				<table id="datatable" class="datatable">
					<thead>
						<tr>
							<th scope="col"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></th>
							<th scope="col" class="textleft"><?php echo $column_title; ?></th>
							<th scope="col" class="center"><?php echo $column_unit; ?></th>
							<th scope="col" class="textleft"><?php echo $column_value; ?></th>
							<th scope="col" class="center"><?php echo $column_action; ?></th>
						</tr>
					</thead>
					<tbody>
						<?php foreach ($length_classes as $length_class) { ?>
							<tr>
								<td scope="row">
									<?php if ($length_class['selected']) { ?>
										<input type="checkbox" name="selected[]" value="<?php echo $length_class['length_class_id']; ?>" checked="checked" />
									<?php } else { ?>
										<input type="checkbox" name="selected[]" value="<?php echo $length_class['length_class_id']; ?>" />
									<?php } ?>
								</td>
								<td scope="row" class="textleft">
									<?php echo $length_class['title']; ?>
								</td>
								<td scope="row" class="">
									<?php echo $length_class['unit']; ?>
								</td>
								<td scope="row" class="textleft">
									<?php echo $length_class['value']; ?>
								</td>
								<td scope="row" class="">
									<?php foreach ($length_class['action'] as $action) { ?>
										[ <a href="<?php echo $action['href']; ?>"><?php echo $action['text']; ?></a> ]
									<?php } ?>
								</td>
							</tr>
						<?php } ?>
					</tbody>
				</table>
			<?php } else { ?>
					<?php echo $text_no_results; ?>
			<?php } ?>


			<div class="button_container container_grey">
				<a onclick="$('#form').submit();" class="button button_red left"><?php echo $button_delete; ?></a>
				<a onclick="location = '<?php echo $insert; ?>';" class="button button_green right"><?php echo $button_insert; ?></a>
			</div>

		</form>

	</div>
</section>

	</div>
</div>

<?php echo $footer; ?>