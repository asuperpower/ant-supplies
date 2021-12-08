import { useState } from 'react';
import {
	BarryBox,
	Bee,
	Cute,
	Tree
} from '../../assets'

const ImageRotation = [Bee, BarryBox, Tree, Cute];

export const ImageViewer = () => {
	const [imageCount, setImageCount] = useState<number>(0);

	const onImageClick = () => {
		if (imageCount < (ImageRotation.length - 1)) {
			setImageCount(imageCount + 1);
		} else {
			setImageCount(0);
		}
	}

	return (
		<img
			src={ImageRotation[imageCount]}
			onClick={() => onImageClick()}
			alt={`${imageCount}`}
		/>
	)
}