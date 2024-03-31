import matplotlib.pyplot as plt
import argparse

def main():
    # Parse command-line arguments
    parser = argparse.ArgumentParser(description='Plot a line chart from bash arrays')
    parser.add_argument('--x', type=str, required=True, help='x array values')
    parser.add_argument('--y', type=str, required=True, help='y array values')
    parser.add_argument('--xlabel', type=str, required=True, help='x axis label')
    parser.add_argument('--ylabel', type=str, required=True, help='y axis label')
    parser.add_argument('--title', type=str, required=True, help='tile of the plot')
    args = parser.parse_args()


    # Convert strings to lists of integers
    x = [int(val) for val in args.x.split(',')]
    y = [int(val) for val in args.y.split(',')]

    # Create a figure and axis objects
    fig, ax = plt.subplots()

    # Plot the data
    ax.plot(x, y)

    # Add labels and a title
    ax.set_xlabel(args.xlabel)
    ax.set_ylabel(args.ylabel)
    ax.set_title(args.title)

    # Save the plot as a PNG file
    plt.savefig("{}.png".format(args.title.replace(" ", "_")), dpi=300, bbox_inches='tight')

if __name__ == '__main__':
    main()
