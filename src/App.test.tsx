import { render, screen } from '@testing-library/react';
import App from './App';

// Not an actual functional requirement 
test('renders alt text of default index', () => {
	render(<App />);
	const linkElement = screen.getByAltText(/0/i);
	expect(linkElement).toBeInTheDocument();
});
