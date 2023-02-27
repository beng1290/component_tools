function [vq_m] = scale_bar(vq_m, scale_in, image_scale, upsample)
    %
    % original scale
    %
    s = size(vq_m);
    % image_scale = .5; % micron / pixel
    %
    % upsampled by 10 fold
    %
    scale = image_scale / upsample;
    %
    pp = 1/scale * scale_in;
    bar_thickness = round(s(1) * 0.0118);
    arm_length = round(s(1) * 0.0582);
    ind_arm_lengths = round(arm_length / 2 - bar_thickness / 2);
    %
    scalebar.bar_lower_bound = s(1) - round(.1095 * s(1));
    scalebar.bar_upper_bound = scalebar.bar_lower_bound - bar_thickness;
    %
    scalebar.bar_left_bound = s(2) - round( 0.4242 * s(2));
    scalebar.bar_right_bound = scalebar.bar_left_bound + pp;
    %
    scalebar.bar_thickness = scalebar.bar_lower_bound - scalebar.bar_upper_bound;
    scalebar.bar_length = scalebar.bar_right_bound - scalebar.bar_left_bound;
    %
    scalebar.lower_arm_bound = scalebar.bar_lower_bound + ind_arm_lengths;
    scalebar.upper_arm_bound =  scalebar.bar_upper_bound - ind_arm_lengths;
    %
    scalebar.arm_length = scalebar.lower_arm_bound - scalebar.upper_arm_bound;
    %
    scalebar.left_arm_right_position = scalebar.bar_left_bound;
    scalebar.left_arm_left_position = scalebar.left_arm_right_position - bar_thickness;
    %
    scalebar.left_arm_thickness = scalebar.left_arm_right_position - scalebar.left_arm_left_position;
    %
    scalebar.right_arm_left_position = scalebar.bar_right_bound;
    scalebar.right_arm_right_position = scalebar.right_arm_left_position + bar_thickness;
    %
    scalebar.right_arm_thickness = scalebar.right_arm_right_position - scalebar.right_arm_left_position;
    %
    vq_m(scalebar.bar_upper_bound:scalebar.bar_lower_bound,...
        scalebar.bar_left_bound:scalebar.bar_right_bound, :)...
        = repmat(255, [scalebar.bar_thickness + 1, scalebar.bar_length + 1, 3]);
    %
    vq_m(scalebar.upper_arm_bound:scalebar.lower_arm_bound,...
        scalebar.left_arm_left_position:scalebar.left_arm_right_position, :)...
        = repmat(255, [scalebar.arm_length + 1, scalebar.left_arm_thickness + 1, 3]);
    vq_m(scalebar.upper_arm_bound:scalebar.lower_arm_bound,...
        scalebar.right_arm_left_position:scalebar.right_arm_right_position, :)...
        = repmat(255, [scalebar.arm_length + 1, scalebar.left_arm_thickness + 1, 3]);
    %
end