<?php echo $header; ?>

	<div class="row">
		<div class="col12 last">

<section class="box_content rounded_corners_all border_green">
	<h2 class="box_content rounded_corners_all border_blue gradient_blue">
		<img src="<?php echo ICON; ?>32/money.png" alt="payment" /> <?php echo $heading_title; ?>
	</h2>

	<div id="content">

		<?php if ($error_warning) { ?>
			<div class="warning"><?php echo $error_warning; ?></div>
		<?php } ?>

		<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">


			<div class="htabs">
				<a href="#tab-registration"><?php echo $tab_registration; ?></a>
				<a href="#tab-general"><?php echo $tab_general; ?></a>
			</div>

			<div id="tab-registration" class="htabs-content">
			<table class="">
				<thead>
					<tr>
						<th scope="col" class="center"><?php echo $column_payable; ?></th>
						<th scope="col" class="center"><?php echo $column_total; ?></th>
					</tr>
				</thead>
				<tbody>
						<tr>
							<td class="">
								<?php if ($error_payable) { ?>
									<input type="text" name="cheque_payable" value="<?php echo $cheque_payable; ?>" placeholder="<?php echo $error_payable; ?>" class="input_error" />
								<?php } else { ?>
									<input type="text" name="cheque_payable" value="<?php echo $cheque_payable; ?>" />
								<?php } ?>
							</td>
							<td>
								<input type="text" name="cheque_total" value="<?php echo $cheque_total; ?>" />
								<?php echo $text_total_hint; ?>
							</td>
						</tr>
				</tbody>
			</table>
			</div>


			<div id="tab-general" class="htabs-content">
			<table class="">
				<thead>
					<tr>
						<th scope="col" class="center"><?php echo $column_order_status; ?></th>
						<th scope="col" class="center"><?php echo $column_geo_zone; ?></th>
						<th scope="col" class="center"><?php echo $column_sort_order; ?></th>
						<th scope="col" class="center"><?php echo $column_action; ?></th>
					</tr>
				</thead>
				<tbody>
						<tr>
							<td>
								<select name="cheque_order_status_id">
									<?php foreach ($order_statuses as $order_status) { ?>
										<?php if ($order_status['order_status_id'] == $cheque_order_status_id) { ?>
											<option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
										<?php } else { ?>
											<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
										<?php } ?>
									<?php } ?>
								</select>
							</td>
							<td class="">
								<select name="cheque_geo_zone_id">
									<option value="0"><?php echo $text_all_zones; ?></option>
									<?php foreach ($geo_zones as $geo_zone) { ?>
										<?php if ($geo_zone['geo_zone_id'] == $cheque_geo_zone_id) { ?>
											<option value="<?php echo $geo_zone['geo_zone_id']; ?>" selected="selected"><?php echo $geo_zone['name']; ?></option>
										<?php } else { ?>
											<option value="<?php echo $geo_zone['geo_zone_id']; ?>"><?php echo $geo_zone['name']; ?></option>
										<?php } ?>
									<?php } ?>
								</select>
							</td>
							<td class="textcenter">
								<input type="text" name="cheque_sort_order" value="<?php echo $cheque_sort_order; ?>" size="1" />
							</td>
							<td class="">
								<select name="cheque_status">
									<?php if ($cheque_status) { ?>
										<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
										<option value="0"><?php echo $text_disabled; ?></option>
									<?php } else { ?>
										<option value="1"><?php echo $text_enabled; ?></option>
										<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
									<?php } ?>
								</select>
							</td>
						</tr>
				</tbody>
			</table>
			</div>


			<div class="button_container container_grey">
				<a onclick="location = '<?php echo $cancel; ?>';" class="button button_red left"><?php echo $button_cancel; ?></a>
				<a onclick="$('#form').submit();" class="button button_green right"><?php echo $button_save; ?></a>
			</div>

		</form>

	</div>
</section>

	</div>
</div>

<?php echo $footer; ?>