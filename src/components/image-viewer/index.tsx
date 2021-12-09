import { useState } from 'react';
import {
	BarryBox,
	Bee,
	Tree
} from '../../assets'
import { usePalette } from 'react-palette';

const ImageRotation = [Bee, Tree, BarryBox];

export const ImageViewer = () => {
	const [imageCount, setImageCount] = useState<number>(0);

	const { data } = usePalette(ImageRotation[imageCount])

	const onImageClick = () => {
		if (imageCount < (ImageRotation.length - 1)) {
			setImageCount(imageCount + 1);
		} else {
			setImageCount(0);
		}
	}

	return (<div className="App" style={{ background: `linear-gradient(90deg, ${data.vibrant} 0%, ${data.vibrant} 5%, ${data.darkVibrant} 100%)` }}>

		<img
			src={ImageRotation[imageCount]}
			onClick={() => onImageClick()}
			alt={`${imageCount}`}
		/>
		{console.log(data)}
	</div>
	)
}