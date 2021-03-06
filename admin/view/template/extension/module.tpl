<?php echo $header; ?>

	<div class="row">
		<div class="col12 last">

<section class="box_content rounded_corners_all border_green">
	<h2 class="box_content rounded_corners_all border_blue gradient_blue">
		<img src="<?php echo ICON; ?>32/modules.png" alt="lock" /> <?php echo $doc_title; ?>
	</h2>

	<div id="content">

		<?php if ($success) { ?>
			<div class="success"><?php echo $success; ?></div>
		<?php } ?>
		<?php if ($error) { ?>
			<div class="warning"><?php echo $error; ?></div>
		<?php } ?>

			<?php if ($extensions) { ?>

				<table id="datatable" class="datatable">
					<thead>
						<tr>
							<th scope="col"><?php echo $column_name; ?></th>
							<th scope="col" class="center"><?php echo $column_action; ?></th>
						</tr>
					</thead>
					<tbody>
						<?php foreach ($extensions as $extension) { ?>
							<tr>
								<td scope="row" class="textleft">
									<?php echo $extension['name']; ?>
								</td>
								<td class="view">
									<?php foreach ($extension['action'] as $action) { ?>
										[ <a href="<?php echo $action['href']; ?>" class=""><?php echo $action['text']; ?></a> ]
									<?php } ?>
								</td>
							</tr>
						<?php } ?>
					</tbody>
				</table>

			<?php } else { ?>
					<?php echo $text_no_results; ?>
			<?php } ?>
		</div>

</section>

	</div>
</div>

<?php echo $footer; ?>